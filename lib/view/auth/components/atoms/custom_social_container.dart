import 'package:datingcase/constants/styles.dart';
import 'package:flutter/material.dart';

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
