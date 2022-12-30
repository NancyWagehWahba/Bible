import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../provider/settings_provider.dart';
import '../../theme/my_theme_data.dart';

class Agpy extends StatefulWidget {
  String agpyName = '';

  @override
  State<Agpy> createState() => _AgpyState();
}

class _AgpyState extends State<Agpy> {
  List<String> agpyList = [];

  SettingsProvider settingsProvider = SettingsProvider();

  String? locale;

  @override
  Widget build(BuildContext context) {
    locale = Localizations.localeOf(context).toString();
    readFile(locale);

    return agpyList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    AppLocalizations.of(context)!.verses,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: (){},
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  agpyList[index],
                                  style: Theme.of(context).textTheme.headline6,
                                  textAlign: TextAlign.center,
                                ),
                                const Divider(
                                  color: MyTheme.armadilloColor,
                                  height: 2,
                                )
                              ],
                            ),
                          )),
                        );
                      },
                      itemCount: agpyList.length,
                    ),
                  ),
                ],
              ),
            );
  }

  String? versesFile;

  void readFile(String? loc) async {
    if (loc == 'ar') {
      versesFile = await rootBundle.loadString('assets/files/agpyAr.txt');
      List<String> verses = versesFile!.trim().split('\n');
      setState(() {
        agpyList = verses;
      });
    } else {
      versesFile = await rootBundle.loadString('assets/files/agpyEn.txt');
      List<String> verses = versesFile!.trim().split('\n');
      setState(() {
        agpyList = verses;
      });
    }
  }
}
