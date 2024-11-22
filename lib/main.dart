import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prop_olx/login_page.dart';
import 'package:prop_olx/signup_page.dart';
import 'package:prop_olx/splash_screen.dart';
import 'package:prop_olx/src/app_colors.dart';
import 'package:prop_olx/src/themes.dart';

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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architect Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      routes: {
        "splash": (context) => const SplashScreen(),
        "login": (context) => const LoginPage(),
        "sign_up": (context) => const SignUpPage( ),

      },
      initialRoute: "splash",
    );
  }
}
