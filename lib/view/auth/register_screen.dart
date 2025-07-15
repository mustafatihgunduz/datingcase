import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/viewmodel/auth_view_model.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/alerts/unexepted_error.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/auth/components/atoms/custom_auth_button.dart';
import 'package:datingcase/view/auth/components/custom_bottom_navigate.dart';
import 'package:datingcase/view/auth/components/custom_social_container_row.dart';
import 'package:datingcase/view/auth/components/register_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocConsumer<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          }
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth! * 0.1,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: SizeConfig.screenHeight! * 0.01,
                            ),
                            child: Text(
                              LocaleKeys.welcome.tr(),
                              style: KStyles.kHeaderTextStyle(context),
                            ),
                          ),
                          Text(
                            LocaleKeys.register_description.tr(),
                            style: KStyles.kSubtitleTextStyle(context),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: KStyles.kFourtySize),

                          RegisterForm(
                            fullNameController: _fullNameController,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            rePasswordController: _rePasswordController,
                          ),

                          SizedBox(height: KStyles.kThirtySize),
                          RichText(
                            text: TextSpan(
                              style: KStyles.kInputHintTextStyle(context),
                              children: [
                                if (parts[0].isNotEmpty)
                                  TextSpan(text: parts[0]),
                                TextSpan(
                                  text: linkText,
                                  style: KStyles.kTextButtonTextStyle(context),
                                  recognizer: TapGestureRecognizer(),
                                ),
                                if (parts.length > 1 && parts[1].isNotEmpty)
                                  TextSpan(text: parts[1]),
                              ],
                            ),
                          ),
                          SizedBox(height: KStyles.kTwentyFourSize),
                          CustomAuthButton(
                            title: LocaleKeys.now_register.tr(),
                            onTap: () async {
                              context.read<AuthBloc>().add(
                                AuthRegisterRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  name: _fullNameController.text,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: KStyles.kThirtySevenSize),
                          SocialAuthRow(),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomBottomNavigate(
                  navigationService: _navigationService,
                  title: LocaleKeys.already_have_an_account.tr(),
                  route: '/login',
                  buttonTitle: LocaleKeys.login_button.tr(),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is AuthFailure) {
            unexceptedError(context, _navigationService);
          }
        },
      ),
    );
  }
}
