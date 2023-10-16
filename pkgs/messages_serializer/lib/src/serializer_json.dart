// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:messages/messages_json.dart';

import 'serializer.dart';

class JsonSerializer extends Serializer<String> {
  final List result = [];

  JsonSerializer([super.writeIds = false]);

  @override
  Serialization<String> serialize(
    String hash,
    String locale,
    List<Message> messages, [
    List<int>? keepOnly,
  ]) {
    result.clear();

    final preamble = JsonPreamble.build(
      serializationVersion: serializationVersion,
      locale: locale,
      hash: hash,
      hasIds: writeIds,
    );

    result.addAll(preamble.toJson());

    final messageList = <String, dynamic>{};
    for (var i = 0; i < messages.length; i++) {
      Object? encoded;
      if (keepOnly?.contains(i) ?? true) {
        encoded = encodeMessage(messages[i], writeId: writeIds);
      } else {
        encoded = null;
      }
      messageList[i.toRadixString(serializationRadix)] = encoded;
    }
    result.add(messageList);

    return Serialization(jsonEncode(result));
  }

  Object encodeMessage(Message message, {bool writeId = false}) {
    // print('Encode message $message');
    Object encodedMessage;
    if (message is StringMessage) {
      encodedMessage = encodeString(message, writeId);
    } else if (message is SelectMessage) {
      encodedMessage = encodeSelect(message, writeId);
    } else if (message is PluralMessage) {
      encodedMessage = encodePlural(message, writeId);
    } else if (message is CombinedMessage) {
      encodedMessage = encodeCombined(message, writeId);
    } else if (message is GenderMessage) {
      encodedMessage = encodeGender(message, writeId);
    } else {
      throw ArgumentError('Unknown message type');
    }
    return encodedMessage;
  }

  /// Encodes a string message as follows:
  ///
  /// If the id does not have to be written, and there are no placeholders:
  /// * the String value
  /// else:
  /// * int | the StringMessage type
  /// * if we write IDs: String | the message id
  /// * String | the String value
  /// * if there are placeholders: List\<List\> | the position pairs:
  ///   * List\<int\> | a pair of position in the string - number of the placeholder
  Object encodeString(StringMessage message, bool isVisible) {
    final containsArgs = message.argPositions.isNotEmpty;
    if ((message.id == null || isVisible == false) && !containsArgs) {
      return message.value;
    }
    final m = [];
    addId(message, m, isVisible);
    m.add(message.value);
    if (containsArgs) {
      final positions = message.argPositions
        ..sort((a, b) => a.stringIndex.compareTo(b.stringIndex));
      for (var i = 0; i < positions.length; i++) {
        m.add([
          positions[i].stringIndex.toRadixString(serializationRadix),
          positions[i].argIndex.toRadixString(serializationRadix),
        ]);
      }
    }
    return m;
  }

  /// Encodes a select message as follows:
  ///
  /// * int | the SelectMessage type
  /// * if we write IDs: String | the message id
  /// * int | the argument index on which the select switches
  /// * Map\<String, int\> | the cases:
  ///   * MapEntry\<String, int\> | a case mapped to the message it represents
  List encodeSelect(SelectMessage message, bool isVisible) {
    final m = [];
    m.add(SelectMessage.type);
    addId(message, m, isVisible);
    m.add(message.argIndex);
    m.add(encodeMessage(message.other));
    final caseIndices = <String, Object>{};
    for (var entry in message.cases.entries) {
      caseIndices[entry.key] = encodeMessage(entry.value);
    }
    m.add(caseIndices);
    return m;
  }

  /// Encodes a plural message as follows:
  ///
  /// * int | the PluralMessage type
  /// * if we write IDs: String | the message id
  /// * int | the argument index on which the plural switches
  /// * int | the index of the other case message, which must be present
  /// * List\<int\> | the cases, which are added in pairs of two:
  ///   * int | the case index as encoded by the constants in `Plural`
  ///   * int | the message index of the case
  List encodePlural(PluralMessage message, bool isVisible) {
    final m = [];
    m.add(PluralMessage.type);
    addId(message, m, isVisible);
    m.add(message.argIndex);
    m.add(encodeMessage(message.other));
    final caseIndices = [];
    if (message.few != null) {
      caseIndices.add(Plural.few);
      caseIndices.add(encodeMessage(message.few!));
    }
    if (message.many != null) {
      caseIndices.add(Plural.many);
      caseIndices.add(encodeMessage(message.many!));
    }
    if (message.zeroNumber != null) {
      caseIndices.add(Plural.zeroNumber);
      caseIndices.add(encodeMessage(message.zeroNumber!));
    }
    if (message.zeroWord != null) {
      caseIndices.add(Plural.zeroWord);
      caseIndices.add(encodeMessage(message.zeroWord!));
    }
    if (message.oneNumber != null) {
      caseIndices.add(Plural.oneNumber);
      caseIndices.add(encodeMessage(message.oneNumber!));
    }
    if (message.oneWord != null) {
      caseIndices.add(Plural.oneWord);
      caseIndices.add(encodeMessage(message.oneWord!));
    }
    if (message.twoNumber != null) {
      caseIndices.add(Plural.twoNumber);
      caseIndices.add(encodeMessage(message.twoNumber!));
    }
    if (message.twoWord != null) {
      caseIndices.add(Plural.twoWord);
      caseIndices.add(encodeMessage(message.twoWord!));
    }
    m.add(caseIndices);
    return m;
  }

  /// Encodes a combined message as follows:
  ///
  /// * int | the CombinedMessage type
  /// * if we write IDs: String | the message id
  /// * List\<int\> | the submessage IDs
  ///   * int | the index of the submessage
  List encodeCombined(CombinedMessage message, bool isVisible) {
    final m = [];
    m.add(CombinedMessage.type);
    addId(message, m, isVisible);
    for (var submessage in message.messages) {
      m.add(encodeMessage(submessage));
    }
    return m;
  }

  /// Encodes a gender message as follows:
  ///
  /// * int | the GenderMessage type
  /// * if we write IDs: String | the message id
  /// * int | the argument index on which the gender switches
  /// * int | the index of the other case message, which must be present
  /// * List\<int\> | the cases, which are added in pairs of two:
  ///   * int | the case index as encoded by the constants in `Gender`
  ///   * int | the message index of the case
  List encodeGender(GenderMessage message, bool isVisible) {
    final m = [];
    m.add(GenderMessage.type);
    addId(message, m, isVisible);
    m.add(message.argIndex);
    m.add(encodeMessage(message.other));
    final caseIndices = [];
    if (message.female != null) {
      caseIndices.add(Gender.female);
      caseIndices.add(encodeMessage(message.female!));
    }
    if (message.male != null) {
      caseIndices.add(Gender.male);
      caseIndices.add(encodeMessage(message.male!));
    }
    m.add(caseIndices);
    return m;
  }

  /// Add a non-null ID iff `writeIds` is enabled
  void addId(Message message, List<dynamic> m, bool isVisible) {
    if (writeIds && message.id != null && isVisible) m.add(message.id!);
  }

  int addMessage(dynamic m) {
    result.add(m);
    return result.length - 1;
  }
}