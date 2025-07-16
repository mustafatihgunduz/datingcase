import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/viewmodel/auth_view_model.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/alerts/unexepted_error.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/auth/components/atoms/custom_auth_button.dart';
import 'package:datingcase/view/auth/components/custom_bottom_navigate.dart';
import 'package:datingcase/view/auth/components/custom_social_container_row.dart';
import 'package:datingcase/view/auth/login/components/atom/forgot_password.dart';
import 'package:datingcase/view/auth/login/components/atom/login_description.dart';
import 'package:datingcase/view/auth/login/components/atom/login_title.dart';
import 'package:datingcase/view/auth/login/components/login_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBuilder extends StatelessWidget {
  const LoginBuilder({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required NavigationService navigationService,
    required GlobalKey<FormState> formKey,
  }) : _emailController = emailController,
       _passwordController = passwordController,
       _navigationService = navigationService,
       _formKey = formKey;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final NavigationService _navigationService;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoading) {
          return CircularProgressIndicator.adaptive();
        }
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.screenWidth! * 0.1,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: SizeConfig.screenHeight! / 1.1,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          LoginTitle(),
                          LoginDescription(),
                          SizedBox(height: KStyles.kFourtySize),
                          LoginForm(
                            formKey: _formKey,
                            emailController: _emailController,
                            passwordController: _passwordController,
                          ),
                          SizedBox(height: KStyles.kThirtySize),
                          ForgotPassword(navigationService: _navigationService),
                          SizedBox(height: KStyles.kTwentyFourSize),
                          CustomAuthButton(
                            title: LocaleKeys.login.tr(),
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<AuthBloc>().add(
                                  AuthLoginRequested(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              }
                            },
                          ),
                          SizedBox(height: KStyles.kThirtySevenSize),
                          SocialAuthRow(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              CustomBottomNavigate(
                navigationService: _navigationService,
                title: LocaleKeys.still_dont_have_an_account.tr(),
                route: '/register',
                buttonTitle: LocaleKeys.register.tr(),
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
    );
  }
}
