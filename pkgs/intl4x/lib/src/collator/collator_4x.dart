// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import '../../intl4x.dart';
import '../options.dart';
import 'collator.dart';
import 'collator_options.dart';

Collator getCollator4X(List<Locale> locales) => Collator4X(locales.first);

class Collator4X extends Collator {
  Collator4X(super.locale);

  // @override
  // List<String> supportedLocalesOf(List<String> locales) {
  //   return intl.icu4xDataKeys.entries
  //       .where((element) => element.value.contains('NumberFormat'))
  //       .map((e) => e.key)
  //       .toList();
  // }

  @override
  int compareImpl(
    String a,
    String b, {
    LocaleMatcher localeMatcher = LocaleMatcher.bestfit,
    Usage usage = Usage.sort,
    Sensitivity? sensitivity,
    bool ignorePunctuation = false,
    bool numeric = false,
    CaseFirst? caseFirst,
    String? collation,
  }) {
    throw UnimplementedError('Insert diplomat bindings here');
  }
}
