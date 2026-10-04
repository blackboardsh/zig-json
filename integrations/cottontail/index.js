/** Load once per runtime using a capability built against this Cottontail/JSC. */
export function loadJsonCapability(libraryPath) {
  const host = globalThis.cottontail;
  if (!host?.loadCapabilityLibrary) throw new Error('Cottontail runtime required');
  host.loadCapabilityLibrary(libraryPath);
  const encoder = new TextEncoder(), decoder = new TextDecoder();
  const bytes = input => typeof input === 'string' ? encoder.encode(input)
    : ArrayBuffer.isView(input) ? new Uint8Array(input.buffer, input.byteOffset, input.byteLength)
    : input;
  const encode = value => {
    const text = JSON.stringify(value);
    if (text === undefined) throw new TypeError('Replacement must serialize to a JSON value');
    return encoder.encode(text);
  };
  return Object.freeze({
    prepare(input, pointers) {
      const handle = host.__zigJsonPrepare(bytes(input), pointers);
      return Object.freeze({
        replace(values) { return new Uint8Array(host.__zigJsonApply(handle, values.map(encode))); },
        replaceRaw(values) { return new Uint8Array(host.__zigJsonApply(handle, values.map(bytes))); },
        original(index) { return new Uint8Array(host.__zigJsonOriginal(handle, index)); },
        dispose() { host.__zigJsonDispose(handle); },
      });
    },
    parseNative(input) {
      const handle = host.__zigJsonParse(bytes(input));
      return Object.freeze({
        getBytes(pointer = '') { return new Uint8Array(host.__zigJsonGet(handle, pointer)); },
        get(pointer = '') { return JSON.parse(decoder.decode(host.__zigJsonGet(handle, pointer))); },
        dispose() { host.__zigJsonDispose(handle); },
      });
    },
  });
}
