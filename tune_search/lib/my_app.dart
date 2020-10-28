import 'package:flutter/material.dart';
import 'package:tune_search/tune_search_localizations.dart';
import 'package:tune_search/tune_search_localizations_delegate.dart';

import 'my_home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (BuildContext context) => TunesSearchLocalizations.of(context).title,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
      supportedLocales: [
        const Locale('en', ''),
        const Locale('de', ''),
      ],
      localizationsDelegates: [
        const TuneSearchLocalizationsDelegate(),
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}