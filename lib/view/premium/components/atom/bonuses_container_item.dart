import 'package:datingcase/constants/styles.dart';
import 'package:flutter/material.dart';

class BonusesContainerItem extends StatelessWidget {
  const BonusesContainerItem({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    String cutText() {
      int firstIndex = text.indexOf(' ');
      if (firstIndex != -1) {
        return text.replaceFirst(' ', '\n', firstIndex);
      } else {
        return text;
      }
    }

    return Column(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: KStyles.kLimitedBoxShadowColor,
            border: Border.all(color: KStyles.kWhiteColor, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.1),
                blurRadius: 10,
                spreadRadius: 0.5,
              ),
            ],
            shape: BoxShape.circle,
          ),
          child: Center(child: Image.asset(image)),
        ),
        SizedBox(height: KStyles.kThirteenSize),
        Text(
          cutText(),
          style: KStyles.kLimitedBoxDescriptionTextStyle(context),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
