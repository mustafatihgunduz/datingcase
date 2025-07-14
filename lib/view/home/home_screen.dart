import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Text(
          LocaleKeys.homepage.tr(),
          style: KStyles.kAppbarTitleTextStyle(context),
        ),
      ),
    );
  }
}
