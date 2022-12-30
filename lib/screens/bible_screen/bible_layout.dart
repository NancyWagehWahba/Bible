import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_bible/screens/bible_screen/bible_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:the_bible/provider/settings_provider.dart';

class Bible extends StatefulWidget {
  @override
  State<Bible> createState() => _BibleState();
}

class _BibleState extends State<Bible> {
  List<String> versesList = [];
  SettingsProvider settingsProvider = SettingsProvider();

  String? locale;
  @override
  Widget build(BuildContext context) {
    locale = Localizations.localeOf(context).toString();
    readFile(locale);
    return versesList.isEmpty
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
                      return BibleItem(versesList[index],(){});
                    },
                    itemCount: versesList.length,
                  ),
                ),
              ],
            ),
          );
  }

  String? versesFile;
  void readFile(String? loc) async {
    if(loc == 'ar'){
      versesFile = await rootBundle.loadString('assets/files/bibleArVerses.txt');
      List<String> verses = versesFile!.trim().split('\n');
      setState(() {
        versesList = verses;
      });
    }else{
      versesFile = await rootBundle.loadString('assets/files/bibleEnVerses.txt');
      List<String> verses = versesFile!.trim().split('\n');
      setState(() {
        versesList = verses;
      });
    }
  }


}
