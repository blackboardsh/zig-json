export type Input = string | ArrayBuffer | ArrayBufferView;
/** Immutable snapshot. Each replacement starts from the original source. */
export interface EditPlan {
  replace(values: readonly unknown[]): Uint8Array;
  replaceRaw(values: readonly Input[]): Uint8Array;
  original(index: number): Uint8Array;
  /** Idempotent. All other operations throw after disposal. */
  dispose(): void;
}
export interface NativeDocument {
  getBytes(pointer?: string): Uint8Array;
  /** Materializes only the selected subtree. JS numeric precision applies. */
  get(pointer?: string): unknown;
  dispose(): void;
}
export interface JsonCapability {
  prepare(input: Input, pointers: readonly string[]): EditPlan;
  parseNative(input: Input): NativeDocument;
}
export function loadJsonCapability(libraryPath: string): JsonCapability;
