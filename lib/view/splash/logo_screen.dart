import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:datingcase/constants/styles.dart';
import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnimatedTextController myAnimatedTextController =
        AnimatedTextController();
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/splash/logo.png'),
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Mustafa Fatih Gündüz tarafından hazırlanmıştır!',
                textStyle: KStyles.kHeaderTextStyle(context),
                textAlign: TextAlign.center,
                speed: const Duration(milliseconds: 50),
              ),
            ],

            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 1000),
            displayFullTextOnTap: false,
            stopPauseOnTap: false,
            controller: myAnimatedTextController,
          ),
        ],
      ),
    );
  }
}
