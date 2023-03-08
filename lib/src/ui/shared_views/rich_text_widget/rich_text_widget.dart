import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'base_text.dart';
import 'link_text.dart';

/// Custom rich text widget
class RichTextWidget extends StatelessWidget {
  /// Rich text widget controller
  const RichTextWidget({
    required Iterable<BaseText> texts,
    super.key,
    TextStyle? styleForAll,
    TextStyle? linkStyle,
    TextAlign? textAlign,
  })  : _texts = texts,
        _styleForAll = styleForAll,
        _linkStyle = linkStyle,
        _textAlign = textAlign;

  final TextStyle? _styleForAll;
  final TextStyle? _linkStyle;
  final Iterable<BaseText> _texts;
  final TextAlign? _textAlign;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: _textAlign ?? TextAlign.start,
      text: TextSpan(
        children: _texts.map(
          (baseText) {
            if (baseText is LinkText) {
              return TextSpan(
                text: baseText.text,
                style: _linkStyle,
                recognizer: TapGestureRecognizer()..onTap = baseText.onTapped,
              );
            } else {
              return TextSpan(
                text: baseText.text,
                style: _styleForAll,
                // ?? KachTextStyles.kBodyMD,
              );
            }
          },
        ).toList(),
      ),
    );
  }
}
