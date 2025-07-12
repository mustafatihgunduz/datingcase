import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/main.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/auth/components/atoms/custom_social_container.dart';
import 'package:datingcase/view/auth/components/atoms/custom_text_field.dart';
import 'package:datingcase/view/auth/components/custom_social_container_row.dart';
import 'package:datingcase/view/auth/components/login_form.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    print((SizeConfig.screenWidth! * 0.084));
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      body: Padding(
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
                          onPressed: () {},
                          child: Text(
                            LocaleKeys.forgot_my_password.tr(),
                            style: KStyles.kTextButtonTextStyle(context),
                          ),
                        ),
                      ),
                      SizedBox(height: KStyles.kTwentyFourSize),
                      CustomAuthButton(),
                      SizedBox(height: KStyles.kThirtySevenSize),
                      SocialAuthRow(),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.still_dont_have_an_account.tr(),
                  style: KStyles.kInputHintTextStyle(context),
                ),
                TextButton(
                  onPressed: () => navigationService.navigateTo('/register'),
                  child: Text(
                    LocaleKeys.register.tr(),
                    style: KStyles.kTextButtonTextStyle(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          LocaleKeys.login.tr(),
          style: KStyles.kButtonTextStyle(context),
        ),
        style: KStyles.kButtonStyle(context),
      ),
    );
  }
}
