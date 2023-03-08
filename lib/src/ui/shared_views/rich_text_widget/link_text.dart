import 'package:flutter/foundation.dart' show VoidCallback, immutable;

import 'base_text.dart';

@immutable

///Link text implementation of base text
class LinkText extends BaseText {
  /// Link text constructor
  const LinkText({
    required super.text,
    this.onTapped,
  });

  /// on tap call back
  final VoidCallback? onTapped;
}
