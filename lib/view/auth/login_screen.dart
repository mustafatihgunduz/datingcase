import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/viewmodel/auth_view_model.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/alerts/feature_add_later.dart';
import 'package:datingcase/utils/alerts/unexepted_error.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/auth/components/atoms/custom_auth_button.dart';
import 'package:datingcase/view/auth/components/custom_bottom_navigate.dart';
import 'package:datingcase/view/auth/components/custom_social_container_row.dart';
import 'package:datingcase/view/auth/components/login_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final NavigationService _navigationService = NavigationService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      body: BlocConsumer<AuthBloc, AuthState>(
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
                              LocaleKeys.login.tr(),
                              style: KStyles.kHeaderTextStyle(context),
                            ),
                          ),
                          Text(
                            LocaleKeys.login_description.tr(),
                            style: KStyles.kSubtitleTextStyle(context),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: KStyles.kFourtySize),
                          LoginForm(
                            emailController: _emailController,
                            passwordController: _passwordController,
                          ),
                          SizedBox(height: KStyles.kThirtySize),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                featureAddLater(context, _navigationService);
                              },
                              child: Text(
                                LocaleKeys.forgot_my_password.tr(),
                                style: KStyles.kTextButtonTextStyle(context),
                              ),
                            ),
                          ),
                          SizedBox(height: KStyles.kTwentyFourSize),
                          CustomAuthButton(
                            title: LocaleKeys.login.tr(),
                            onTap: () {
                              context.read<AuthBloc>().add(
                                AuthLoginRequested(
                                  email: _emailController.text,
                                  password: _passwordController.text,
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
      ),
    );
  }
}
