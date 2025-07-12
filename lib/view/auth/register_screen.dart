import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/auth/components/atoms/custom_text_field.dart';
import 'package:datingcase/view/auth/components/custom_social_container_row.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: KStyles.kButtonStyle(context),
                          child: Text(
                            LocaleKeys.now_register.tr(),
                            style: KStyles.kButtonTextStyle(context),
                          ),
                        ),
                      ),
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
                  LocaleKeys.already_have_an_account.tr(),
                  style: KStyles.kInputHintTextStyle(context),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    LocaleKeys.login_button.tr(),
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
