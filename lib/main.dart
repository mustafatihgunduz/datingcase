import 'package:datingcase/core/repository/auth_repository.dart';
import 'package:datingcase/core/repository/movie_repository.dart';
import 'package:datingcase/core/repository/user_repository.dart';
import 'package:datingcase/core/services/auth_service.dart';
import 'package:datingcase/core/services/firebase_analytics_service.dart';
import 'package:datingcase/core/services/movie_service.dart';
import 'package:datingcase/core/services/navigation_service.dart';
import 'package:datingcase/core/services/secure_storage_service.dart';
import 'package:datingcase/core/services/user_service.dart';
import 'package:datingcase/core/viewmodel/auth_view_model.dart';
import 'package:datingcase/core/viewmodel/movie_view_model.dart';
import 'package:datingcase/core/viewmodel/user_view_model.dart';
import 'package:datingcase/firebase_options.dart';
import 'package:datingcase/utils/routes.dart';
import 'package:datingcase/view/check/auth_check.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final NavigationService navigationService = NavigationService();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await FirebaseAnalyticsService().logAppOpen();
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
final UserService userService = UserService();
final UserRepository userRepository = UserRepository(userService: userService);
final AuthService authService = AuthService();
final AuthRepository authRepository = AuthRepository(authService: authService);
final MovieService movieService = MovieService();
final MovieRepository movieRepository = MovieRepository(
  movieService: movieService,
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(
            storageService: secureStorageService,
            authRepository: authRepository,
          ),
        ),
        BlocProvider(create: (_) => UserBloc(userRepository: userRepository)),
        BlocProvider<MovieBloc>(
          create: (_) =>
              MovieBloc(movieRepository: movieRepository)
                ..add(LoadInitialMovies()),
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
        home: AuthCheck(),
      ),
    );
  }
}
