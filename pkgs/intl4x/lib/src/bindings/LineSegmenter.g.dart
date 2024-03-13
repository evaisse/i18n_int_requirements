// generated by diplomat-tool

// https://github.com/dart-lang/sdk/issues/53946
// ignore_for_file: non_native_function_type_argument_to_pointer

part of 'lib.g.dart';

/// An ICU4X line-break segmenter, capable of finding breakpoints in strings.
///
/// See the [Rust documentation for `LineSegmenter`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html) for more information.
final class LineSegmenter implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _underlying;

  final core.List<Object> _edge_self;

  // Internal constructor from FFI.
  // isOwned is whether this is owned (has finalizer) or not
  // This also takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  LineSegmenter._(this._underlying, bool isOwned, this._edge_self) {
    if (isOwned) {
      _finalizer.attach(this, _underlying.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_ICU4XLineSegmenter_destroy));

  /// Construct a [`LineSegmenter`] with default options. It automatically loads the best
  /// available payload data for Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_auto`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_auto) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.auto(DataProvider provider) {
    final result = _ICU4XLineSegmenter_create_auto(provider._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok, true, []);
  }

  /// Construct a [`LineSegmenter`] with default options and LSTM payload data for
  /// Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_lstm`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_lstm) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.lstm(DataProvider provider) {
    final result = _ICU4XLineSegmenter_create_lstm(provider._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok, true, []);
  }

  /// Construct a [`LineSegmenter`] with default options and dictionary payload data for
  /// Burmese, Khmer, Lao, and Thai..
  ///
  /// See the [Rust documentation for `new_dictionary`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_dictionary) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.dictionary(DataProvider provider) {
    final result = _ICU4XLineSegmenter_create_dictionary(provider._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok, true, []);
  }

  /// Construct a [`LineSegmenter`] with custom options. It automatically loads the best
  /// available payload data for Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_auto_with_options`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_auto_with_options) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.autoWithOptions(DataProvider provider, LineBreakOptions options) {
    final temp = ffi2.Arena();
    final result = _ICU4XLineSegmenter_create_auto_with_options_v1(provider._underlying, options._pointer(temp));
    temp.releaseAll();
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok, true, []);
  }

  /// Construct a [`LineSegmenter`] with custom options and LSTM payload data for
  /// Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_lstm_with_options`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_lstm_with_options) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.lstmWithOptions(DataProvider provider, LineBreakOptions options) {
    final temp = ffi2.Arena();
    final result = _ICU4XLineSegmenter_create_lstm_with_options_v1(provider._underlying, options._pointer(temp));
    temp.releaseAll();
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok, true, []);
  }

  /// Construct a [`LineSegmenter`] with custom options and dictionary payload data for
  /// Burmese, Khmer, Lao, and Thai.
  ///
  /// See the [Rust documentation for `new_dictionary_with_options`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.new_dictionary_with_options) for more information.
  ///
  /// Throws [Error] on failure.
  factory LineSegmenter.dictionaryWithOptions(DataProvider provider, LineBreakOptions options) {
    final temp = ffi2.Arena();
    final result = _ICU4XLineSegmenter_create_dictionary_with_options_v1(provider._underlying, options._pointer(temp));
    temp.releaseAll();
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return LineSegmenter._(result.union.ok, true, []);
  }

  /// Segments a string.
  ///
  /// Ill-formed input is treated as if errors had been replaced with REPLACEMENT CHARACTERs according
  /// to the WHATWG Encoding Standard.
  ///
  /// See the [Rust documentation for `segment_utf16`](https://docs.rs/icu/latest/icu/segmenter/struct.LineSegmenter.html#method.segment_utf16) for more information.
  LineBreakIteratorUtf16 segment(String input) {
    final inputView = input.utf16View;
    final inputArena = _FinalizedArena();
    // This lifetime edge depends on lifetimes: 'a
    core.List<Object> aEdges = [this, inputArena];
    final result = _ICU4XLineSegmenter_segment_utf16(_underlying, inputView.pointer(inputArena.arena), inputView.length);
    return LineBreakIteratorUtf16._(result, true, [], aEdges);
  }
}

@meta.ResourceIdentifier()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'ICU4XLineSegmenter_destroy')
// ignore: non_constant_identifier_names
external void _ICU4XLineSegmenter_destroy(ffi.Pointer<ffi.Void> self);

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'ICU4XLineSegmenter_create_auto')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XLineSegmenter_create_auto(ffi.Pointer<ffi.Opaque> provider);

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'ICU4XLineSegmenter_create_lstm')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XLineSegmenter_create_lstm(ffi.Pointer<ffi.Opaque> provider);

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'ICU4XLineSegmenter_create_dictionary')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XLineSegmenter_create_dictionary(ffi.Pointer<ffi.Opaque> provider);

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LineBreakOptionsFfi)>(isLeaf: true, symbol: 'ICU4XLineSegmenter_create_auto_with_options_v1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XLineSegmenter_create_auto_with_options_v1(ffi.Pointer<ffi.Opaque> provider, _LineBreakOptionsFfi options);

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LineBreakOptionsFfi)>(isLeaf: true, symbol: 'ICU4XLineSegmenter_create_lstm_with_options_v1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XLineSegmenter_create_lstm_with_options_v1(ffi.Pointer<ffi.Opaque> provider, _LineBreakOptionsFfi options);

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, _LineBreakOptionsFfi)>(isLeaf: true, symbol: 'ICU4XLineSegmenter_create_dictionary_with_options_v1')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XLineSegmenter_create_dictionary_with_options_v1(ffi.Pointer<ffi.Opaque> provider, _LineBreakOptionsFfi options);

@meta.ResourceIdentifier()
@ffi.Native<ffi.Pointer<ffi.Opaque> Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Uint16>, ffi.Size)>(isLeaf: true, symbol: 'ICU4XLineSegmenter_segment_utf16')
// ignore: non_constant_identifier_names
external ffi.Pointer<ffi.Opaque> _ICU4XLineSegmenter_segment_utf16(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Uint16> inputData, int inputLength);
