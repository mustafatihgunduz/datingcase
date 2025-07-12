import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/auth/components/atoms/custom_social_container.dart';
import 'package:flutter/material.dart';

class SocialAuthRow extends StatelessWidget {
  const SocialAuthRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
