import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/view/premium/components/atom/bonuses_container_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BonusesItemRow extends StatelessWidget {
  const BonusesItemRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BonusesContainerItem(
          image: 'assets/icons/premium.png',
          text: LocaleKeys.premium_account.tr(),
        ),
        BonusesContainerItem(
          image: 'assets/icons/more_match.png',
          text: LocaleKeys.more_matching.tr(),
        ),
        BonusesContainerItem(
          image: 'assets/icons/highlight.png',
          text: LocaleKeys.highlight.tr(),
        ),
        BonusesContainerItem(
          image: 'assets/icons/more_like.png',
          text: LocaleKeys.more_likes.tr(),
        ),
      ],
    );
  }
}
