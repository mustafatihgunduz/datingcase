import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 62,
          height: 62,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.amber,
          ),
        ),
        SizedBox(width: KStyles.kEightSize),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mustafa  Gündüz',
              style: KStyles.kAppbarTitleTextStyle(context),
            ),
            Text('ID: 123456', style: KStyles.kInputHintTextStyle(context)),
          ],
        ),
        SizedBox(width: KStyles.kThirtySixSize),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: KStyles.kButtonStyle(context),
            child: FittedBox(
              child: Text(
                LocaleKeys.add_picture.tr(),
                style: KStyles.kButtonTextStyle(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
