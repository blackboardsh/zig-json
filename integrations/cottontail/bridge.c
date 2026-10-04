/* Uses Cottontail's version-matched, prefixed JSC bridge. */
#include "native_capability.h"
#include "capability_host.h"
typedef struct { const unsigned char *ptr; size_t len; } Slice;
extern const char *zj_error(void);
extern void *zj_prepare(const unsigned char*,size_t,const Slice*,size_t);
extern void zj_plan_free(void*);
extern unsigned char *zj_apply(const void*,const Slice*,size_t,size_t*);
extern unsigned char *zj_original(const void*,size_t,size_t*);
extern void *zj_parse(const unsigned char*,size_t);
extern void zj_doc_free(void*);
extern unsigned char *zj_get(const void*,const unsigned char*,size_t,size_t*);
typedef struct { void *ptr; int is_plan; } Handle;
static JSClassRef handle_class;
static void release(Handle *h) { if(h&&h->ptr){if(h->is_plan)zj_plan_free(h->ptr);else zj_doc_free(h->ptr);h->ptr=NULL;} }
static void finalize(JSObjectRef object) { Handle *h=JSObjectGetPrivate(object);release(h);free(h); }
static Handle *handle(JSContextRef ctx,JSValueRef value,int kind,JSValueRef *err) {
    if(!JSValueIsObjectOfClass(ctx,value,handle_class)){ct_throw_type_error(ctx,err,"Expected zig-json handle");return NULL;}
    Handle *h=JSObjectGetPrivate((JSObjectRef)value);
    if(!h||!h->ptr){ct_throw_message(ctx,err,"Disposed zig-json handle");return NULL;}
    if(kind>=0&&h->is_plan!=kind){ct_throw_type_error(ctx,err,"Wrong zig-json handle kind");return NULL;}return h;
}
static JSValueRef wrap(JSContextRef ctx,void *ptr,int kind,JSValueRef *err) {
    if(!ptr){ct_throw_message(ctx,err,zj_error());return JSValueMakeUndefined(ctx);}
    Handle *h=malloc(sizeof(*h));if(!h){if(kind)zj_plan_free(ptr);else zj_doc_free(ptr);ct_throw_message(ctx,err,"OutOfMemory");return JSValueMakeUndefined(ctx);}
    h->ptr=ptr;h->is_plan=kind;return JSObjectMake(ctx,handle_class,h);
}
static JSValueRef output(JSContextRef ctx,unsigned char *p,size_t len,JSValueRef *err){
    if(!p){ct_throw_message(ctx,err,zj_error());return JSValueMakeUndefined(ctx);}
    return JSObjectMakeArrayBufferWithBytesNoCopy(ctx,p,len,ct_array_buffer_free,NULL,err);
}
static int bytes(JSContextRef ctx,JSValueRef v,Slice *s,JSValueRef *err){
    unsigned char *p=NULL;if(ct_get_bytes(ctx,v,&p,&s->len)||(!p&&s->len)){ct_throw_type_error(ctx,err,"Expected UTF-8 bytes");return -1;}s->ptr=p?p:(const unsigned char*)"";return 0;
}
/* Copy array elements into owned buffers: getters/coercion can invoke JS/GC and
   detach earlier buffers. Nothing borrowed survives another JS property read. */
static Slice *list(JSContextRef ctx,JSValueRef v,size_t *n,int strings,JSValueRef *err){
    if(!JSValueIsObject(ctx,v)){ct_throw_type_error(ctx,err,"Expected array-like object");return NULL;}
    JSObjectRef arr=(JSObjectRef)v;JSValueRef length=ct_get_property(ctx,arr,"length",err);
    if(*err)return NULL;double count=JSValueToNumber(ctx,length,err);
    if(*err||!isfinite(count)||count<0||count>65536||floor(count)!=count){ct_throw_message(ctx,err,"Too many JSON paths/values");return NULL;}
    *n=(size_t)count;Slice *out=calloc(*n?*n:1,sizeof(Slice));if(!out){ct_throw_message(ctx,err,"OutOfMemory");return NULL;}
    JSValueRef held=NULL;
    for(size_t i=0;i<*n;i++){
        JSValueRef item=JSObjectGetPropertyAtIndex(ctx,arr,(unsigned)i,err);if(*err)goto fail;
        held=item;JSValueProtect(ctx,held);
        if(strings){
            if(!JSValueIsString(ctx,item)){ct_throw_type_error(ctx,err,"Pointers must be strings");goto fail;}
            out[i].ptr=(unsigned char*)ct_value_to_utf8_copy_checked(ctx,item,&out[i].len,err);if(!out[i].ptr)goto fail;
        }else{
            Slice tmp;if(bytes(ctx,item,&tmp,err))goto fail;
            unsigned char *copy=malloc(tmp.len?tmp.len:1);if(!copy){ct_throw_message(ctx,err,"OutOfMemory");goto fail;}
            memcpy(copy,tmp.ptr,tmp.len);out[i]=(Slice){copy,tmp.len};
        }
        JSValueUnprotect(ctx,held);held=NULL;
    }return out;
fail:
    if(held)JSValueUnprotect(ctx,held);
    for(size_t i=0;i<*n;i++)free((void*)out[i].ptr);free(out);return NULL;
}
static void free_list(Slice *v,size_t n){for(size_t i=0;i<n;i++)free((void*)v[i].ptr);free(v);}
static JSValueRef prepare(JSContextRef ctx,JSObjectRef fn,JSObjectRef self,size_t n,const JSValueRef args[],JSValueRef *err){
    (void)fn;(void)self;if(n!=2){ct_throw_type_error(ctx,err,"Expected bytes, pointers");return JSValueMakeUndefined(ctx);}
    size_t count=0;Slice *paths=list(ctx,args[1],&count,1,err);if(!paths)return JSValueMakeUndefined(ctx);
    Slice input;if(bytes(ctx,args[0],&input,err)){free_list(paths,count);return JSValueMakeUndefined(ctx);}
    void *p=zj_prepare(input.ptr,input.len,paths,count);free_list(paths,count);return wrap(ctx,p,1,err);
}
static JSValueRef apply(JSContextRef ctx,JSObjectRef fn,JSObjectRef self,size_t n,const JSValueRef args[],JSValueRef *err){
    (void)fn;(void)self;if(n!=2){ct_throw_type_error(ctx,err,"Expected plan, replacements");return JSValueMakeUndefined(ctx);}
    size_t count=0;Slice *values=list(ctx,args[1],&count,0,err);if(!values)return JSValueMakeUndefined(ctx);
    Handle *h=handle(ctx,args[0],1,err);if(!h){free_list(values,count);return JSValueMakeUndefined(ctx);}
    size_t len=0;unsigned char *p=zj_apply(h->ptr,values,count,&len);free_list(values,count);return output(ctx,p,len,err);
}
static JSValueRef original(JSContextRef ctx,JSObjectRef fn,JSObjectRef self,size_t n,const JSValueRef args[],JSValueRef *err){
    (void)fn;(void)self;if(n!=2){ct_throw_type_error(ctx,err,"Expected plan, index");return JSValueMakeUndefined(ctx);}
    double index=JSValueToNumber(ctx,args[1],err);if(*err)return JSValueMakeUndefined(ctx);
    if(!isfinite(index)||index<0||index>65536||floor(index)!=index){ct_throw_message(ctx,err,"Invalid index");return JSValueMakeUndefined(ctx);}
    Handle *h=handle(ctx,args[0],1,err);if(!h)return JSValueMakeUndefined(ctx);
    size_t len=0;unsigned char *p=zj_original(h->ptr,(size_t)index,&len);return output(ctx,p,len,err);
}
static JSValueRef parse(JSContextRef ctx,JSObjectRef fn,JSObjectRef self,size_t n,const JSValueRef args[],JSValueRef *err){
    (void)fn;(void)self;Slice input;if(n!=1){ct_throw_type_error(ctx,err,"Expected bytes");return JSValueMakeUndefined(ctx);}
    if(bytes(ctx,args[0],&input,err))return JSValueMakeUndefined(ctx);return wrap(ctx,zj_parse(input.ptr,input.len),0,err);
}
static JSValueRef get(JSContextRef ctx,JSObjectRef fn,JSObjectRef self,size_t n,const JSValueRef args[],JSValueRef *err){
    (void)fn;(void)self;if(n!=2||!JSValueIsString(ctx,args[1])){ct_throw_type_error(ctx,err,"Expected document, pointer string");return JSValueMakeUndefined(ctx);}
    size_t pn=0;char *pointer=ct_value_to_utf8_copy_checked(ctx,args[1],&pn,err);if(!pointer)return JSValueMakeUndefined(ctx);
    Handle *h=handle(ctx,args[0],0,err);if(!h){free(pointer);return JSValueMakeUndefined(ctx);}
    size_t len=0;unsigned char *p=zj_get(h->ptr,(unsigned char*)pointer,pn,&len);free(pointer);return output(ctx,p,len,err);
}
static JSValueRef dispose(JSContextRef ctx,JSObjectRef fn,JSObjectRef self,size_t n,const JSValueRef args[],JSValueRef *err){
    (void)fn;(void)self;if(n!=1||!JSValueIsObjectOfClass(ctx,args[0],handle_class)){ct_throw_type_error(ctx,err,"Expected zig-json handle");return JSValueMakeUndefined(ctx);}
    release(JSObjectGetPrivate((JSObjectRef)args[0]));return JSValueMakeUndefined(ctx);
}
#if defined(_WIN32)
__declspec(dllexport)
#else
__attribute__((visibility("default")))
#endif
int cottontail_capability_init(JSContextRef ctx,JSObjectRef target,const CtCapabilityHost *host){
    (void)host;if(!handle_class){JSClassDefinition def=kJSClassDefinitionEmpty;def.className="ZigJsonHandle";def.finalize=finalize;handle_class=JSClassCreate(&def);}
    const struct{const char *name;JSObjectCallAsFunctionCallback fn;} methods[]={
        {"__zigJsonPrepare",prepare},{"__zigJsonApply",apply},{"__zigJsonOriginal",original},
        {"__zigJsonParse",parse},{"__zigJsonGet",get},{"__zigJsonDispose",dispose}};
    for(size_t i=0;i<sizeof(methods)/sizeof(methods[0]);i++){
        JSClassDefinition def=kJSClassDefinitionEmpty;def.className=methods[i].name;def.callAsFunction=methods[i].fn;
        JSClassRef cls=JSClassCreate(&def);JSObjectRef fn=JSObjectMake(ctx,cls,NULL);JSClassRelease(cls);
        JSValueRef err=NULL;ct_set_property(ctx,target,methods[i].name,fn,&err);if(err)return -1;
    }return 0;
}
