import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
    print((SizeConfig.screenWidth! * 0.1).ceil());
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth! * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: SizeConfig.screenHeight! * 0.01),
              child: Text('Login', style: KStyles.kHeaderTextStyle(context)),
            ),
            Text(
              'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.',
              style: KStyles.kSubtitleTextStyle(context),
              textAlign: TextAlign.center,
            ),
            TextFormField(
              controller: _emailController,
              style: KStyles.kInputHintTextStyle(context),
              decoration: KStyles.kInputDecoration(
                context,
                'E-Posta',
                'assets/icons/email.png',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              style: KStyles.kInputHintTextStyle(context),
              decoration: KStyles.kInputDecoration(
                context,
                'Şifre',
                'assets/icons/password.png',
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Şifremi Unuttum',
                  style: KStyles.kTextButtonTextStyle(context),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Giriş Yap',
                  style: KStyles.kButtonTextStyle(context),
                ),
                style: KStyles.kButtonStyle(context),
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialAuthContainer(
                  onTap: () {},
                  iconPath: 'assets/icons/google-icon.png',
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth! * 0.02,
                  ),
                  child: SocialAuthContainer(
                    onTap: () {},
                    iconPath: 'assets/icons/apple-icon.png',
                  ),
                ),
                SocialAuthContainer(
                  onTap: () {},
                  iconPath: 'assets/icons/facebook-icon.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialAuthContainer extends StatelessWidget {
  const SocialAuthContainer({
    super.key,
    required this.onTap,
    required this.iconPath,
  });

  final String iconPath;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: KStyles.kSocialContainerPadding,
        decoration: KStyles.kSocialContainerDecoration(),
        child: Image.asset(iconPath),
      ),
    );
  }
}
