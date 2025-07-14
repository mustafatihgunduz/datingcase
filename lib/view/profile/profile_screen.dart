import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/size_config.dart';
import 'package:datingcase/view/components/custom_back_button.dart';
import 'package:datingcase/view/profile/components/user_detail.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final NavigationService _navigationService = NavigationService();
  @override
  Widget build(BuildContext context) {
    print(SizeConfig.screenWidth! * 0.082);
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      appBar: AppBar(
        leadingWidth: 72,
        forceMaterialTransparency: true,
        leading: CustomBackArrow(navigationService: _navigationService),
        title: Text(
          LocaleKeys.profile_detail.tr(),
          style: KStyles.kAppbarTitleTextStyle(context),
        ),
        actions: [
          ElevatedButton(
            style: KStyles.kLimitedOfferButtonStyle(context),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/icons/diamond.png'),
                SizedBox(width: KStyles.kFourSize),
                Text(
                  LocaleKeys.limited_offer.tr(),
                  style: KStyles.kLimitedOfferButtonTextStyle(context),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: KStyles.kFiftySize,
          left: KStyles.kThirtySixSize,
          right: KStyles.kTwentySixSize,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserDetail(),
              Text(
                LocaleKeys.my_liked_movies.tr(),
                style: KStyles.kSubtitleTextStyle(
                  context,
                ).copyWith(fontWeight: FontWeight.bold),
              ),
              // GridView.builder(
              //   shrinkWrap: true,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //     crossAxisCount: 2,
              //   ),
              //   itemBuilder: (context, index) {
              //     return Container(child: Text('Merhaba'));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
