// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../../intl4x.dart';
import '../options.dart';
import 'number_format.dart';

NumberFormat? getNumberFormatter(
  List<Locale> locales,
  LocaleMatcher localeMatcher,
) =>
    throw UnimplementedError('Cannot use ECMA outside of web environments.');
