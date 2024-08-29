// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'intl4x.dart';

export 'src/list_format/list_format.dart';
export 'src/list_format/list_format_options.dart';
export 'src/options.dart';

extension DatetimeFormatIntl4x on List<String> {
  String toLocaleFormat([Locale? locale]) =>
      Intl(locale: locale).listFormat().format(this);
}
