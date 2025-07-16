import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.leadingIcon,
    this.hasTrailing = false,
    this.trailingIcon = 'assets/icons/hide.png',
  });

  final TextEditingController controller;
  final String hintText;
  final String leadingIcon;
  final String trailingIcon;
  final bool hasTrailing;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: KStyles.kInputHintTextStyle(context),
      decoration: KStyles.kInputDecoration(
        context,
        hintText,
        leadingIcon,
        trailingIcon: trailingIcon,
        hasTrailing: hasTrailing,
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return LocaleKeys.this_field_cannot_be_empty.tr();
        }
        return null;
      },
    );
  }
}
