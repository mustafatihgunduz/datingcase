import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/view/auth/components/atoms/custom_text_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formKey,
  }) : _emailController = emailController,
       _passwordController = passwordController,
       _formKey = formKey;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
