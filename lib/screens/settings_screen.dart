import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../base/app_events.dart';
import '../base/app_states.dart';
import '../base/locale_bloc.dart';

class SettingsScreen extends StatelessWidget {
  // List of languages with their names and corresponding locales
  final List<Map<String, dynamic>> languages = [
    {'label': 'English', 'locale': const Locale('en', '')},
    {'label': 'Hindi', 'locale': const Locale('hi', '')},
  ];

  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: BlocBuilder<LocaleBloc, AppStates>(
        builder: (context, state) {
          // Set the locale from the state if it's changed
          Locale locale = currentLocale;
          if (state is LocaleChanged) {
            locale = state.locale;
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Displaying a localized message in the current locale
                Text(
                  AppLocalizations.of(context)!.message,
                  style: const TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),

                // Dropdown button for language selection
                DropdownButton<Locale>(
                  value: languages.firstWhere(
                      (language) => language['locale'] == currentLocale,
                      orElse: () => languages[0])['locale'],
                  onChanged: (Locale? newLocale) {
                    if (newLocale != null) {
                      // Dispatch ChangeLocale event to update the locale
                      context.read<LocaleBloc>().add(ChangeLocale(newLocale));
                    }
                  },
                  items: languages.map((language) {
                    return DropdownMenuItem<Locale>(
                      value: language['locale'],
                      child: Text(language['label']),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
