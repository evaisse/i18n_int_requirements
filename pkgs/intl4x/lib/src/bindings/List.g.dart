// generated by diplomat-tool

// https://github.com/dart-lang/sdk/issues/53946
// ignore_for_file: non_native_function_type_argument_to_pointer

part of 'lib.g.dart';

/// A list of strings
final class List implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _underlying;

  final core.List<Object> _edge_self;

  // Internal constructor from FFI.
  // isOwned is whether this is owned (has finalizer) or not
  // This also takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  List._(this._underlying, bool isOwned, this._edge_self) {
    if (isOwned) {
      _finalizer.attach(this, _underlying.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_ICU4XList_destroy));

  /// Create a new list of strings
  factory List() {
    final result = _ICU4XList_create();
    return List._(result, true, []);
  }

  /// Create a new list of strings with preallocated space to hold
  /// at least `capacity` elements
  factory List.withCapacity(int capacity) {
    final result = _ICU4XList_create_with_capacity(capacity);
    return List._(result, true, []);
  }

  /// Push a string to the list
  ///
  /// Ill-formed input is treated as if errors had been replaced with REPLACEMENT CHARACTERs according
  /// to the WHATWG Encoding Standard.
  void push(String val) {
    final temp = ffi2.Arena();
    final valView = val.utf8View;
    _ICU4XList_push(_underlying, valView.pointer(temp), valView.length);
    temp.releaseAll();
  }

  /// The number of elements in this list
  int get length {
    final result = _ICU4XList_len(_underlying);
    return result;
  }

  /// Whether this list is empty
  bool get isEmpty {
    final result = _ICU4XList_is_empty(_underlying);
    return result;
  }
}

@meta.ResourceIdentifier()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'ICU4XList_destroy')
// ignore: non_constant_identifier_names
external void _ICU4XList_destroy(ffi.Pointer<ffi.Void> self);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function()>(isLeaf: true, symbol: 'ICU4XList_create')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _ICU4XList_create();

@meta.ResourceIdentifier()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Size)>(isLeaf: true, symbol: 'ICU4XList_create_with_capacity')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _ICU4XList_create_with_capacity(int capacity);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Uint8>, ffi.Size)>(isLeaf: true, symbol: 'ICU4XList_push')
// ignore: non_constant_identifier_names
external void _ICU4XList_push(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Uint8> valData, int valLength);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Size Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'ICU4XList_len')
// ignore: non_constant_identifier_names
external int _ICU4XList_len(ffi.Pointer<ffi.Opaque> self);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Bool Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'ICU4XList_is_empty')
// ignore: non_constant_identifier_names
external bool _ICU4XList_is_empty(ffi.Pointer<ffi.Opaque> self);