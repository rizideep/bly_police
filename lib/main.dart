import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prop_olx/base/app_states.dart';
import 'package:prop_olx/login_page.dart';
import 'package:prop_olx/signup_page.dart';
import 'package:prop_olx/splash_screen.dart';
import 'package:prop_olx/src/app_colors.dart';
import 'package:prop_olx/src/themes.dart';

import 'base/locale_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: colorWhite, // Color for Android
      statusBarBrightness:
          Brightness.dark // Dark == white status bar -- for IOS.
      ));
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(BlocProvider(
    create: (context) => LocaleBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocaleBloc(),
      child: BlocBuilder<LocaleBloc, AppStates>(
        builder: (context, state) {
          // Default locale is Hindi
          Locale locale = const Locale('hi');
          // Update locale if state is LocaleChanged
          if (state is LocaleChanged) {
            locale = state.locale;
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: locale,
            // Use the locale from the state
            supportedLocales: const [
              Locale('en'), // English
              Locale('hi'), // Hindi
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: 'Bly Police',
            theme: lightTheme,
            darkTheme: darkTheme,
            routes: {
              "splash": (context) => const SplashScreen(),
              "login": (context) => const LoginPage(),
              "sign_up": (context) => const SignUpPage(),
            },
            initialRoute: "splash",
          );
        },
      ),
    );
  }
}
