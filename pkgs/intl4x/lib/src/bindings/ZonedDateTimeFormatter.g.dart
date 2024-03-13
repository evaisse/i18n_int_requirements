// generated by diplomat-tool

// https://github.com/dart-lang/sdk/issues/53946
// ignore_for_file: non_native_function_type_argument_to_pointer

part of 'lib.g.dart';

/// An object capable of formatting a date time with time zone to a string.
///
/// See the [Rust documentation for `ZonedDateTimeFormatter`](https://docs.rs/icu/latest/icu/datetime/struct.ZonedDateTimeFormatter.html) for more information.
final class ZonedDateTimeFormatter implements ffi.Finalizable {
  final ffi.Pointer<ffi.Opaque> _underlying;

  final core.List<Object> _edge_self;

  // Internal constructor from FFI.
  // isOwned is whether this is owned (has finalizer) or not
  // This also takes in a list of lifetime edges (including for &self borrows)
  // corresponding to data this may borrow from. These should be flat arrays containing
  // references to objects, and this object will hold on to them to keep them alive and
  // maintain borrow validity.
  ZonedDateTimeFormatter._(this._underlying, bool isOwned, this._edge_self) {
    if (isOwned) {
      _finalizer.attach(this, _underlying.cast());
    }
  }

  static final _finalizer = ffi.NativeFinalizer(ffi.Native.addressOf(_ICU4XZonedDateTimeFormatter_destroy));

  /// Creates a new [`ZonedDateTimeFormatter`] from locale data.
  ///
  /// This function has `date_length` and `time_length` arguments and uses default options
  /// for the time zone.
  ///
  /// See the [Rust documentation for `try_new`](https://docs.rs/icu/latest/icu/datetime/struct.ZonedDateTimeFormatter.html#method.try_new) for more information.
  ///
  /// Throws [Error] on failure.
  factory ZonedDateTimeFormatter.withLengths(DataProvider provider, Locale locale, DateLength dateLength, TimeLength timeLength) {
    final result = _ICU4XZonedDateTimeFormatter_create_with_lengths(provider._underlying, locale._underlying, dateLength.index, timeLength.index);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return ZonedDateTimeFormatter._(result.union.ok, true, []);
  }

  /// Creates a new [`ZonedDateTimeFormatter`] from locale data.
  ///
  /// This function has `date_length` and `time_length` arguments and uses an ISO-8601 style
  /// fallback for the time zone with the given configurations.
  ///
  /// See the [Rust documentation for `try_new`](https://docs.rs/icu/latest/icu/datetime/struct.ZonedDateTimeFormatter.html#method.try_new) for more information.
  ///
  /// Throws [Error] on failure.
  factory ZonedDateTimeFormatter.withLengthsAndIso8601TimeZoneFallback(DataProvider provider, Locale locale, DateLength dateLength, TimeLength timeLength, IsoTimeZoneOptions zoneOptions) {
    final temp = ffi2.Arena();
    final result = _ICU4XZonedDateTimeFormatter_create_with_lengths_and_iso_8601_time_zone_fallback(provider._underlying, locale._underlying, dateLength.index, timeLength.index, zoneOptions._pointer(temp));
    temp.releaseAll();
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return ZonedDateTimeFormatter._(result.union.ok, true, []);
  }

  /// Formats a [`DateTime`] and [`CustomTimeZone`] to a string.
  ///
  /// See the [Rust documentation for `format`](https://docs.rs/icu/latest/icu/datetime/struct.ZonedDateTimeFormatter.html#method.format) for more information.
  ///
  /// Throws [Error] on failure.
  String formatDatetimeWithCustomTimeZone(DateTime datetime, CustomTimeZone timeZone) {
    final writeable = _Writeable();
    final result = _ICU4XZonedDateTimeFormatter_format_datetime_with_custom_time_zone(_underlying, datetime._underlying, timeZone._underlying, writeable._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return writeable.finalize();
  }

  /// Formats a [`IsoDateTime`] and [`CustomTimeZone`] to a string.
  ///
  /// See the [Rust documentation for `format`](https://docs.rs/icu/latest/icu/datetime/struct.ZonedDateTimeFormatter.html#method.format) for more information.
  ///
  /// Throws [Error] on failure.
  String formatIsoDatetimeWithCustomTimeZone(IsoDateTime datetime, CustomTimeZone timeZone) {
    final writeable = _Writeable();
    final result = _ICU4XZonedDateTimeFormatter_format_iso_datetime_with_custom_time_zone(_underlying, datetime._underlying, timeZone._underlying, writeable._underlying);
    if (!result.isOk) {
      throw Error.values.firstWhere((v) => v._underlying == result.union.err);
    }
    return writeable.finalize();
  }
}

@meta.ResourceIdentifier()
@ffi.Native<ffi.Void Function(ffi.Pointer<ffi.Void>)>(isLeaf: true, symbol: 'ICU4XZonedDateTimeFormatter_destroy')
// ignore: non_constant_identifier_names
external void _ICU4XZonedDateTimeFormatter_destroy(ffi.Pointer<ffi.Void> self);

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>, ffi.Int32, ffi.Int32)>(isLeaf: true, symbol: 'ICU4XZonedDateTimeFormatter_create_with_lengths')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XZonedDateTimeFormatter_create_with_lengths(ffi.Pointer<ffi.Opaque> provider, ffi.Pointer<ffi.Opaque> locale, int dateLength, int timeLength);

@meta.ResourceIdentifier()
@ffi.Native<_ResultOpaqueInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>, ffi.Int32, ffi.Int32, _IsoTimeZoneOptionsFfi)>(isLeaf: true, symbol: 'ICU4XZonedDateTimeFormatter_create_with_lengths_and_iso_8601_time_zone_fallback')
// ignore: non_constant_identifier_names
external _ResultOpaqueInt32 _ICU4XZonedDateTimeFormatter_create_with_lengths_and_iso_8601_time_zone_fallback(ffi.Pointer<ffi.Opaque> provider, ffi.Pointer<ffi.Opaque> locale, int dateLength, int timeLength, _IsoTimeZoneOptionsFfi zoneOptions);

@meta.ResourceIdentifier()
@ffi.Native<_ResultVoidInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'ICU4XZonedDateTimeFormatter_format_datetime_with_custom_time_zone')
// ignore: non_constant_identifier_names
external _ResultVoidInt32 _ICU4XZonedDateTimeFormatter_format_datetime_with_custom_time_zone(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Opaque> datetime, ffi.Pointer<ffi.Opaque> timeZone, ffi.Pointer<ffi.Opaque> writeable);

@meta.ResourceIdentifier()
@ffi.Native<_ResultVoidInt32 Function(ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>, ffi.Pointer<ffi.Opaque>)>(isLeaf: true, symbol: 'ICU4XZonedDateTimeFormatter_format_iso_datetime_with_custom_time_zone')
// ignore: non_constant_identifier_names
external _ResultVoidInt32 _ICU4XZonedDateTimeFormatter_format_iso_datetime_with_custom_time_zone(ffi.Pointer<ffi.Opaque> self, ffi.Pointer<ffi.Opaque> datetime, ffi.Pointer<ffi.Opaque> timeZone, ffi.Pointer<ffi.Opaque> writeable);
