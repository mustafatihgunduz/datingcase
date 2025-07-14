import 'package:datingcase/constants/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future adaptiveDialog<T>({
  required BuildContext context,
  required String title,
  required String content,
  required VoidCallback onPress,
  required VoidCallback positiveOnPress,
  required String buttonAction1,
  required String buttonAction2,
  bool? barrierDismissible,
  Color? barrierColor,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  TraversalEdgeBehavior? traversalEdgeBehavior,
}) {
  final ThemeData theme = Theme.of(context);
  switch (theme.platform) {
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
    case TargetPlatform.linux:
    case TargetPlatform.windows:
      return sDialog(
        context: context,
        onPress: onPress,
        positiveOnPress: positiveOnPress,
        buttonAction1: buttonAction1,
        buttonAction2: buttonAction2,
        barrierDismissible: barrierDismissible ?? true,
        barrierColor: barrierColor,
        barrierLabel: barrierLabel,
        useSafeArea: useSafeArea,
        useRootNavigator: useRootNavigator,
        routeSettings: routeSettings,
        anchorPoint: anchorPoint,
        traversalEdgeBehavior: traversalEdgeBehavior,
        title: title,
        content: content,
      );
    case TargetPlatform.iOS:
    case TargetPlatform.macOS:
      return sCupertinoDialog(
        context: context,
        onPress: onPress,
        positiveOnPress: positiveOnPress,
        buttonAction1: buttonAction1,
        buttonAction2: buttonAction2,
        title: title,
        content: content,
        barrierDismissible: barrierDismissible ?? false,
        barrierLabel: barrierLabel,
        useRootNavigator: useRootNavigator,
        anchorPoint: anchorPoint,
        routeSettings: routeSettings,
      );
  }
}

sCupertinoDialog({
  required BuildContext context,
  required bool barrierDismissible,
  required VoidCallback onPress,
  required VoidCallback positiveOnPress,
  required String buttonAction1,
  required String buttonAction2,
  String? barrierLabel,
  required bool useRootNavigator,
  Offset? anchorPoint,
  RouteSettings? routeSettings,
  required String title,
  required String content,
}) {
  return showCupertinoDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: barrierLabel,
    useRootNavigator: useRootNavigator,
    anchorPoint: anchorPoint,
    routeSettings: routeSettings,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          CupertinoDialogAction(
            onPressed: onPress,
            child: Text(
              buttonAction1,
              style: KStyles.kAlertDialogButtonTextStyle(
                context,
                CupertinoColors.destructiveRed,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: positiveOnPress,
            child: Text(
              buttonAction2,
              style: KStyles.kAlertDialogButtonTextStyle(
                context,
                CupertinoColors.systemBlue,
              ),
            ),
          ),
        ],
      );
    },
  );
}

sDialog({
  required BuildContext context,
  required bool barrierDismissible,
  required String title,
  required String content,
  required VoidCallback onPress,
  required VoidCallback positiveOnPress,
  required String buttonAction1,
  required String buttonAction2,
  Color? barrierColor,
  String? barrierLabel,
  required bool useSafeArea,
  required bool useRootNavigator,
  RouteSettings? routeSettings,
  Offset? anchorPoint,
  TraversalEdgeBehavior? traversalEdgeBehavior,
}) {
  return showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierColor: barrierColor,
    anchorPoint: anchorPoint,
    routeSettings: routeSettings,
    useRootNavigator: useRootNavigator,
    traversalEdgeBehavior: traversalEdgeBehavior,
    builder: (context) {
      return AlertDialog(
        title: Text(title, style: KStyles.kHeaderTextStyle(context)),
        content: Text(content, style: KStyles.kAlertDialogTextStyle(context)),
        actions: [
          TextButton(
            onPressed: onPress,
            child: Text(
              buttonAction1,
              style: KStyles.kAlertDialogButtonTextStyle(
                context,
                CupertinoColors.destructiveRed,
              ),
            ),
          ),
          TextButton(
            onPressed: positiveOnPress,
            child: Text(
              buttonAction2,
              style: KStyles.kAlertDialogButtonTextStyle(
                context,
                CupertinoColors.systemBlue,
              ),
            ),
          ),
        ],
      );
    },
  );
}
