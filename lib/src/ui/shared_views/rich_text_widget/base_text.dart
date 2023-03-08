import 'package:flutter/foundation.dart' show VoidCallback, immutable;

import 'link_text.dart';

@immutable

/// Base text for rich text widget
class BaseText {
  /// constructor for base text
  const BaseText({
    required this.text,
  });

  /// constructor for plain base text
  factory BaseText.plain({required String text}) {
    return BaseText(text: text);
  }

  /// constructor for link or highlighted base text
  factory BaseText.highlighted({required String text, VoidCallback? onTapped}) {
    return LinkText(text: text, onTapped: onTapped);
  }

  /// String text for base text widget
  final String text;
}
