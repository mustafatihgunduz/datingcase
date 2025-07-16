import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/view/auth/register/components/register_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final NavigationService _navigationService = NavigationService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final template = LocaleKeys.aggrement_text.tr();
    final linkText = LocaleKeys.terms_link.tr();
    final parts = template.split('{link}');
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      body: RegisterBuilder(
        fullNameController: _fullNameController,
        emailController: _emailController,
        passwordController: _passwordController,
        rePasswordController: _rePasswordController,
        parts: parts,
        linkText: linkText,
        navigationService: _navigationService,
        formKey: _formKey,
      ),
    );
  }
}
