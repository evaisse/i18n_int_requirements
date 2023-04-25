// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

@TestOn('browser')
library;

import 'package:intl4x/ecma_policy.dart';
import 'package:intl4x/intl.dart';
import 'package:test/test.dart';

import '../utils.dart';

void main() {
  group('List style options', () {
    var list = ['A', 'B', 'C'];
    var collatorChoice = Intl(
      ecmaPolicy: AlwaysEcma(),
      locale: 'en_US',
    ).collator;
    testWithFormatting('long', () {
      var formatter = collatorChoice.custom();
      expect(list..sort(formatter.compare), orderedEquals(list));
    });
  });
}
