import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:prop_olx/base/app_events.dart';
import 'package:prop_olx/screens/settings_screen.dart';
import 'package:prop_olx/signup_page.dart';
import 'package:prop_olx/utils/getx_storage.dart';
import 'package:shimmer/shimmer.dart';

import 'base/app_bloc.dart';
import 'base/app_callbacks.dart';
import 'base/app_states.dart';
import 'custom_widget/error_screen.dart';
import 'custom_widget/no_internet_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin
    implements AppErrorCallback, AppNetworkCallback {
  late AppBloc appBloc;
  final box = GetStorageUtil();
  final _formKey = GlobalKey<FormState>();
  String? username, password;

  @override
  void initState() {
    super.initState();
    appBloc = AppBloc();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocConsumer<AppBloc, AppStates>(
            bloc: appBloc,
            listener: (context, state) async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
              if (state is SuccessState) {}
            },
            builder: (BuildContext context, AppStates state) {
              return getPageState(state);
            },
          ),
        ));
  }

  getPageState(AppStates appStates) {
    if (appStates is NeutralState) {
      return getMainView();
    } else if (appStates is NetworkErrorState) {
      return NoInternetScreen(this);
    } else if (appStates is ErrorState) {
      return ErrorScreen(
        this,
        appStates.appError.errorMessage,
        appStates.appError.statusCode,
      );
    } else if (appStates is SuccessState) {
      return getMainView();
    } else if (appStates is LoadingState) {
      return getMainView();
    }
  }

  getMainView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text(
            "Login",
            style: TextStyle(
              fontSize: 25,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 50,),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Username",
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) => username = value,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.deepPurple,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) => password = value,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    performLoginApi();
                    // if (_formKey.currentState!.validate()) {
                    //   _formKey.currentState!.save();
                    //   // Handle login logic here
                    //   print("Username: $username, Password: $password");
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.deepPurple,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void performLoginApi() {
    appBloc
        .add(LoginEvent("mobileNumber", "accessToken", "isSdCode", "source"));
  }

  @override
  onErrorCall() {
    performLoginApi();
  }

  @override
  onRetry() {
    performLoginApi();
  }
}
