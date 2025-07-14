import 'dart:io';

import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/image_picker_service.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/view/auth/components/atoms/custom_auth_button.dart';
import 'package:datingcase/view/components/custom_back_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final NavigationService _navigationService = NavigationService();
  final ImagePickerService _imagePickerService = ImagePickerService();
  File? _selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leadingWidth: 72,
        leading: CustomBackArrow(navigationService: _navigationService),
        title: Text(
          LocaleKeys.profile_detail.tr(),
          style: KStyles.kAppbarTitleTextStyle(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 300),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: KStyles.kFiftySize,
                        bottom: KStyles.kEightSize,
                      ),
                      child: Text(
                        LocaleKeys.add_picture.tr(),
                        style: KStyles.kHeaderTextStyle(context),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: KStyles.kFourtyEightSize,
                      ),
                      child: Text(
                        LocaleKeys.picture_description.tr(),
                        style: KStyles.kSubtitleTextStyle(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    _selectedImage != null
                        ? badges.Badge(
                            badgeContent: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedImage = null;
                                });
                              },
                              child: Icon(
                                CupertinoIcons.xmark,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                            badgeStyle: badges.BadgeStyle(
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.white,
                              ),
                              shape: badges.BadgeShape.circle,
                            ),
                            child: Container(
                              width: 168,
                              height: 168,
                              clipBehavior: Clip.hardEdge,
                              decoration:
                                  KStyles.kAddPhotoContainerDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.file(
                                  _selectedImage!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () async {
                              var image = await _imagePickerService
                                  .pickImageFromGallery();
                              if (image != null) {
                                setState(() {
                                  _selectedImage = image;
                                });
                              }
                            },
                            child: Container(
                              width: 168,
                              height: 168,
                              padding: EdgeInsets.all(KStyles.kSeventySize),
                              decoration:
                                  KStyles.kAddPhotoContainerDecoration(),
                              child: Image.asset('assets/icons/plus.png'),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: KStyles.kTwentySixSize),
              child: CustomAuthButton(
                title: LocaleKeys.continue_button.tr(),
                onTap: () {
                  _navigationService.pushReplacement('/nav');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
