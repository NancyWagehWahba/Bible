import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_bible/layout/home_layout.dart';
import 'package:the_bible/provider/settings_provider.dart';
import 'package:the_bible/theme/my_theme_data.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (buildContext) => SettingsProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingsProvider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.currentLang),

      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
      },
      themeMode: settingsProvider.currentThemeMode,
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,

    );
  }
}
