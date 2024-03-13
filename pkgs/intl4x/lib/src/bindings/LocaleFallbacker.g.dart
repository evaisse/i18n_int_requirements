// generated by diplomat-tool

// https://github.com/dart-lang/sdk/issues/53946
// ignore_for_file: non_native_function_type_argument_to_pointer

part of 'lib.g.dart';

/// An object that runs the ICU4X locale fallback algorithm.
///
/// See the [Rust documentation for `LocaleFallbacker`](https://docs.rs/icu/latest/icu/locid_transform/fallback/struct.LocaleFallbacker.html) for more information.
final class LocaleFallbacker implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _underlying;

  final core.List<Object> _edge_self;

  // Internal constructor from FFI.
  // isOwned is whether this is owned (has finalizer) or not
  // This also takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  LocaleFallbacker._(this._underlying, bool isOwned, this._edge_self) {
    if (isOwned) {
      _finalizer.attach(this, _underlying.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_ICU4XLocaleFallbacker_destroy));

  /// Creates a new `LocaleFallbacker` from a data provider.
  ///
  /// See the [Rust documentation for `new`](https://docs.rs/icu/latest/icu/locid_transform/fallback/struct.LocaleFallbacker.html#method.new) for more information.
  ///
  /// Throws [Error] on failure.
  factory LocaleFallbacker(DataProvider provider) {
    final result = _ICU4XLocaleFallbacker_create(provider._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LocaleFallbacker._(result.union.ok, true, []);
  }

  /// Creates a new `LocaleFallbacker` without data for limited functionality.
  ///
  /// See the [Rust documentation for `new_without_data`](https://docs.rs/icu/latest/icu/locid_transform/fallback/struct.LocaleFallbacker.html#method.new_without_data) for more information.
  factory LocaleFallbacker.withoutData() {
    final result = _ICU4XLocaleFallbacker_create_without_data();
    return LocaleFallbacker._(result, true, []);
  }

  /// Associates this `LocaleFallbacker` with configuration options.
  ///
  /// See the [Rust documentation for `for_config`](https://docs.rs/icu/latest/icu/locid_transform/fallback/struct.LocaleFallbacker.html#method.for_config) for more information.
  ///
  /// Throws [Error] on failure.
  LocaleFallbackerWithConfig forConfig(LocaleFallbackConfig config) {
    final temp = ffi2.Arena();
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this];
    final result = _ICU4XLocaleFallbacker_for_config(_underlying, config._pointer(temp));
    temp.releaseAll();
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LocaleFallbackerWithConfig._(result.union.ok, true, [], aEdges);
  }
}

@meta.ResourceIdentifier()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'ICU4XLocaleFallbacker_destroy')
// ignore: non_constant_identifier_names
external void _ICU4XLocaleFallbacker_destroy(ffi.Pointer<ffi.Void> self);

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'ICU4XLocaleFallbacker_create')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XLocaleFallbacker_create(ffi.Pointer<ffi.Opaque> provider);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'ICU4XLocaleFallbacker_create_without_data')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _ICU4XLocaleFallbacker_create_without_data();

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LocaleFallbackConfigFfi)>(isLeaf: true, symbol: 'ICU4XLocaleFallbacker_for_config')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XLocaleFallbacker_for_config(ffi.Pointer<ffi.Opaque> self, _LocaleFallbackConfigFfi config);