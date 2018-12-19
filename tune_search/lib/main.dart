import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'platform_app.dart';
import 'search_result_view_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'tune_search_localizations_delegate.dart';
import 'tune_search_localizations.dart';

void main() => runApp(MyApp(model: SearchResultViewModel()));

class MyApp extends StatelessWidget {
  final SearchResultViewModel model;

  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<SearchResultViewModel>(
      model: model,
      child: PlatformApp(
        onGenerateTitle: (BuildContext context) => TunesSearchLocalizations.of(context).title,
        home: MyHomePage(),            
        supportedLocales: [
          const Locale('en', ''),
          const Locale('de', ''),
        ],
        localizationsDelegates: [
          const TuneSearchLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
