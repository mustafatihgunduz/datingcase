import 'package:datingcase/constants/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AgreeAndTerms extends StatelessWidget {
  const AgreeAndTerms({super.key, required this.parts, required this.linkText});

  final List<String> parts;
  final String linkText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: KStyles.kInputHintTextStyle(context),
        children: [
          if (parts[0].isNotEmpty) TextSpan(text: parts[0]),
          TextSpan(
            text: linkText,
            style: KStyles.kTextButtonTextStyle(context),
            recognizer: TapGestureRecognizer(),
          ),
          if (parts.length > 1 && parts[1].isNotEmpty) TextSpan(text: parts[1]),
        ],
      ),
    );
  }
}
