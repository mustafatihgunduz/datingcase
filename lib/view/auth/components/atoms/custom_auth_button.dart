import 'package:datingcase/constants/styles.dart';
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({super.key, required this.title, required this.onTap});
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: KStyles.kButtonStyle(context),
        child: Text(title, style: KStyles.kButtonTextStyle(context)),
      ),
    );
  }
}
