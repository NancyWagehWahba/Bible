import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String initialValue = 'Light theme';

  String initialValueLan = 'English';

  @override
  Widget build(BuildContext context) {
    List<String> listTheme = [
      AppLocalizations.of(context)!.light,
      AppLocalizations.of(context)!.dark
      // 'Light theme', 'Dark theme'
    ];
    List<String> listLanguage = [
      AppLocalizations.of(context)!.english,
      AppLocalizations.of(context)!.arabic
      // 'English', 'Arabic'
    ];
    var settingsProvider = Provider.of<SettingsProvider>(context);

    return listTheme.isEmpty || listLanguage.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //choose theme
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(AppLocalizations.of(context)!.theme,
                      style: Theme.of(context).textTheme.headline4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton(
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    iconSize: 30,
                    value: initialValue,
                    items:
                        listTheme.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        onTap: () {
                          if (value == AppLocalizations.of(context)!.light) {
                            settingsProvider.changeTheme(ThemeMode.light);
                            value = AppLocalizations.of(context)!.light;
                          } else {
                            settingsProvider.changeTheme(ThemeMode.dark);
                            value = AppLocalizations.of(context)!.dark;
                          }
                        },
                        value: value,
                        child: Text(value,
                            style: Theme.of(context).textTheme.headline6),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        initialValue = value!;
                      });
                    },
                  ),
                ),

                //choose language
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Text(AppLocalizations.of(context)!.language,
                      style: Theme.of(context).textTheme.headline4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton(
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    iconSize: 30,
                    value: initialValueLan,
                    items: listLanguage.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        onTap: () {
                          if (value == AppLocalizations.of(context)!.english) {
                            settingsProvider.changeLoc('en');
                            value = AppLocalizations.of(context)!.english;
                          } else {
                            settingsProvider.changeLoc('ar');
                            value = AppLocalizations.of(context)!.arabic;
                          }
                        },
                        value: value,
                        child: Text(
                            value,
                            style: Theme.of(context).textTheme.headline6),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        initialValueLan = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
