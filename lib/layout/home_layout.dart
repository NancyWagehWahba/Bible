import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bible/screens/agpy_screen/agpy_layout.dart';
import 'package:the_bible/screens/bible_screen/bible_layout.dart';
import 'package:the_bible/screens/pray_layout.dart';
import 'package:the_bible/screens/radio.dart';
import 'package:the_bible/screens/settings.dart';
import 'package:the_bible/provider/settings_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      AppLocalizations.of(context)!.bible,
      AppLocalizations.of(context)!.pray,
      AppLocalizations.of(context)!.agpy,
      AppLocalizations.of(context)!.radio,
      AppLocalizations.of(context)!.settings
    ];

    var settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  settingsProvider.currentThemeMode == ThemeMode.light
                      ? 'assets/images/bglight.jpg'
                      : 'assets/images/bg-dark.jpg'),
              fit: BoxFit.fill),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(titles[selectedIndex]),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => {
            setState(() {
              selectedIndex = index;
            })
          },
          currentIndex: selectedIndex,
          iconSize: 40,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage('assets/icons/bible.png')),
              label: AppLocalizations.of(context)!.bible,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage('assets/icons/pray.png')),
              label: AppLocalizations.of(context)!.pray,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage('assets/icons/the agpy.png')),
              label: AppLocalizations.of(context)!.agpy,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const ImageIcon(AssetImage('assets/icons/radio.png')),
              label: AppLocalizations.of(context)!.radio,
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            ),
          ],
        ),
        body: widgets[selectedIndex],
      ),
    );
  }

  List<Widget> widgets = [
    Bible(),
    Pray(),
    Agpy(),
    RadioLayout(),
    Settings()
  ];
}
