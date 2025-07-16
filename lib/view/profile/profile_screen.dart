import 'package:datingcase/constants/styles.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/viewmodel/movie_view_model.dart';
import 'package:datingcase/core/viewmodel/user_view_model.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/view/components/custom_back_button.dart';
import 'package:datingcase/view/premium/limited_box_screen.dart';
import 'package:datingcase/view/profile/components/profile_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final NavigationService _navigationService = NavigationService();

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(LoadUserProfile());
    context.read<MovieBloc>().add(LoadFavoriteMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KStyles.kPageColor,
      appBar: _buildAppbar(context),
      body: ProfileBuilder(navigationService: _navigationService),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      leadingWidth: 72,
      forceMaterialTransparency: true,
      leading: CustomBackArrow(
        navigationService: _navigationService,
        isProfileScreen: true,
      ),
      title: Center(
        child: Text(
          LocaleKeys.profile_detail.tr(),
          style: KStyles.kAppbarTitleTextStyle(context),
        ),
      ),
      actions: [
        ElevatedButton(
          style: KStyles.kLimitedOfferButtonStyle(context),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return LimitedBoxScreen();
              },
            );
          },
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
    );
  }
}
