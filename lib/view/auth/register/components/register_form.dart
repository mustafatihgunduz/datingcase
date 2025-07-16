import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/view/auth/components/atoms/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required TextEditingController fullNameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController rePasswordController,
  }) : _fullNameController = fullNameController,
       _emailController = emailController,
       _passwordController = passwordController,
       _rePasswordController = rePasswordController;

  final TextEditingController _fullNameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _rePasswordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: _fullNameController,
          hintText: LocaleKeys.fullname.tr(),
          leadingIcon: 'assets/icons/user.png',
          hasTrailing: false,
        ),
        SizedBox(height: KStyles.kThirteenSize),

        CustomTextField(
          controller: _emailController,
          hintText: LocaleKeys.email.tr(),
          leadingIcon: 'assets/icons/email.png',
          hasTrailing: false,
        ),
        SizedBox(height: KStyles.kThirteenSize),
        CustomTextField(
          controller: _passwordController,
          hintText: LocaleKeys.password.tr(),
          leadingIcon: 'assets/icons/password.png',
          hasTrailing: true,
        ),
        SizedBox(height: KStyles.kThirteenSize),
        CustomTextField(
          controller: _rePasswordController,
          hintText: LocaleKeys.re_password.tr(),
          leadingIcon: 'assets/icons/password.png',
          hasTrailing: true,
        ),
      ],
    );
  }
}
