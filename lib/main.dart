import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/services/secure_storage_service.dart';
import 'package:datingcase/core/viewmodel/auth_view_model.dart';
import 'package:datingcase/utils/routes.dart';
import 'package:datingcase/view/auth/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final NavigationService navigationService = NavigationService();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('tr')],
      path: 'assets/translations',
      startLocale: Locale('tr'),
      fallbackLocale: Locale('tr'),
      child: const MyApp(),
    ),
  );
}

final SecureStorageService secureStorageService = SecureStorageService();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(storageService: secureStorageService),
        ),
      ],
      child: MaterialApp(
        navigatorKey: navigationService.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Dating Case',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routes: appRoutes,
        home: LoginScreen(),
      ),
    );
  }
}
