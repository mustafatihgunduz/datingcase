import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  UserDetail({
    super.key,
    required this.image,
    required this.userName,
    required this.userID,
  });
  String image;
  String userName;
  String userID;
  @override
  Widget build(BuildContext context) {
    String cutId() {
      if (userID.length >= 15) {
        return userID.substring(0, 15) + "...";
      } else {
        return userID;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      image == "" ? "https://picsum.photos/200" : image,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: KStyles.kEightSize),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: KStyles.kAppbarTitleTextStyle(context),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      'ID: ${cutId()}',
                      style: KStyles.kInputHintTextStyle(context),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: KStyles.kThirtySixSize),
        ElevatedButton(
          onPressed: () {},
          style: KStyles.kButtonStyle(context, isProfile: true),
          child: Text(
            LocaleKeys.add_picture.tr(),
            style: KStyles.kButtonTextStyle(context),
          ),
        ),
      ],
    );
  }
}
