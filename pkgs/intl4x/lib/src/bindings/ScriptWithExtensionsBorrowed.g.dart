// generated by diplomat-tool

// https://github.com/dart-lang/sdk/issues/53946
// ignore_for_file: non_native_function_type_argument_to_pointer

part of 'lib.g.dart';

/// A slightly faster ICU4XScriptWithExtensions object
///
/// See the [Rust documentation for `ScriptWithExtensionsBorrowed`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensionsBorrowed.html) for more information.
final class ScriptWithExtensionsBorrowed implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _underlying;

  final core.List<Object> _edge_self;
  final core.List<Object> _edge_a;

  // Internal constructor from FFI.
  // isOwned is whether this is owned (has finalizer) or not
  // This also takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  ScriptWithExtensionsBorrowed._(this._underlying, bool isOwned, this._edge_self, this._edge_a) {
    if (isOwned) {
      _finalizer.attach(this, _underlying.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_ICU4XScriptWithExtensionsBorrowed_destroy));

  /// Get the Script property value for a code point
  ///
  /// See the [Rust documentation for `get_script_val`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensionsBorrowed.html#method.get_script_val) for more information.
  int getScriptVal(int codePoint) {
    final result = _ICU4XScriptWithExtensionsBorrowed_get_script_val(_underlying, codePoint);
    return result;
  }

  /// Get the Script property value for a code point
  ///
  /// See the [Rust documentation for `get_script_extensions_val`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensionsBorrowed.html#method.get_script_extensions_val) for more information.
  ScriptExtensionsSet getScriptExtensionsVal(int codePoint) {
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _ICU4XScriptWithExtensionsBorrowed_get_script_extensions_val(_underlying, codePoint);
    return ScriptExtensionsSet._(result, true, [], aEdges);
  }

  /// Check if the Script_Extensions property of the given code point covers the given script
  ///
  /// See the [Rust documentation for `has_script`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensionsBorrowed.html#method.has_script) for more information.
  bool hasScript(int codePoint, int script) {
    final result = _ICU4XScriptWithExtensionsBorrowed_has_script(_underlying, codePoint, script);
    return result;
  }

  /// Build the CodePointSetData corresponding to a codepoints matching a particular script
  /// in their Script_Extensions
  ///
  /// See the [Rust documentation for `get_script_extensions_set`](https://docs.rs/icu/latest/icu/properties/script/struct.ScriptWithExtensionsBorrowed.html#method.get_script_extensions_set) for more information.
  CodePointSetData getScriptExtensionsSet(int script) {
    final result = _ICU4XScriptWithExtensionsBorrowed_get_script_extensions_set(_underlying, script);
    return CodePointSetData._(result, true, []);
  }
}

@meta.ResourceIdentifier()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'ICU4XScriptWithExtensionsBorrowed_destroy')
// ignore: non_constant_identifier_names
external void _ICU4XScriptWithExtensionsBorrowed_destroy(ffi.Pointer<ffi.Void> self);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Uint16 Function(ffi.Pointer<ffi.Opaque>, ffi.Uint32)>(isLeaf: true, symbol: 'ICU4XScriptWithExtensionsBorrowed_get_script_val')
// ignore: non_constant_identifier_names
external int _ICU4XScriptWithExtensionsBorrowed_get_script_val(ffi.Pointer<ffi.Opaque> self, int codePoint);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint32)>(isLeaf: true, symbol: 'ICU4XScriptWithExtensionsBorrowed_get_script_extensions_val')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _ICU4XScriptWithExtensionsBorrowed_get_script_extensions_val(ffi.Pointer<ffi.Opaque> self, int codePoint);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Bool Function(ffi.Pointer<ffi.Opaque>, ffi.Uint32, ffi.Uint16)>(isLeaf: true, symbol: 'ICU4XScriptWithExtensionsBorrowed_has_script')
// ignore: non_constant_identifier_names
external bool _ICU4XScriptWithExtensionsBorrowed_has_script(ffi.Pointer<ffi.Opaque> self, int codePoint, int script);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Uint16)>(isLeaf: true, symbol: 'ICU4XScriptWithExtensionsBorrowed_get_script_extensions_set')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _ICU4XScriptWithExtensionsBorrowed_get_script_extensions_set(ffi.Pointer<ffi.Opaque> self, int script);
