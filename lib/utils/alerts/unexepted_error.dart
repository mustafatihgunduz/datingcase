import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/generated/locale_keys.g.dart';
import 'package:datingcase/utils/alert_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<dynamic> unexceptedError(
  BuildContext context,
  NavigationService navigationService,
) {
  return adaptiveDialog(
    context: context,
    title: LocaleKeys.error.tr(),
    content: LocaleKeys.unexpected_error.tr(),
    onPress: () => navigationService.goBack(),
    positiveOnPress: () => navigationService.goBack(),
    buttonAction1: LocaleKeys.button_cancel.tr(),
    buttonAction2: LocaleKeys.button_understand.tr(),
  );
}
