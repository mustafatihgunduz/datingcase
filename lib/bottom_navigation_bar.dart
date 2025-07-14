import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/view/home/home_screen.dart';
import 'package:datingcase/view/profile/profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;
  List<Widget> pages = [HomeScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: KStyles.kBottomNavbarContainerPadding,
              decoration: KStyles.kBottomNavbarContainerDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/home.png'),
                  SizedBox(width: KStyles.kEightSize),
                  Text(
                    LocaleKeys.homepage.tr(),
                    style: KStyles.kBottomNavbarTitleTextStyle(context),
                  ),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: KStyles.kBottomNavbarContainerPadding,
              decoration: KStyles.kBottomNavbarContainerDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/icons/profile.png'),
                  SizedBox(width: KStyles.kEightSize),
                  Text(
                    LocaleKeys.profile.tr(),
                    style: KStyles.kBottomNavbarTitleTextStyle(context),
                  ),
                ],
              ),
            ),
            label: '',
          ),
        ],
      ),
      backgroundColor: KStyles.kPageColor,
      body: pages[_currentIndex],
    );
  }
}
