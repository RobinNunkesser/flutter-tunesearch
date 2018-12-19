import 'package:flutter/widgets.dart';
import 'dart:async';
import 'tune_search_localizations.dart';


class TuneSearchLocalizationsDelegate extends LocalizationsDelegate<TunesSearchLocalizations> {
  const TuneSearchLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'de'].contains(locale.languageCode);

  @override
  Future<TunesSearchLocalizations> load(Locale locale) => TunesSearchLocalizations.load(locale);

  @override
  bool shouldReload(TuneSearchLocalizationsDelegate old) => false;
}