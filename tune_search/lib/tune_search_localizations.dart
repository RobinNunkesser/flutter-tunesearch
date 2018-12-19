import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'l10n/messages_all.dart';

class TunesSearchLocalizations {
  static Future<TunesSearchLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return TunesSearchLocalizations();
    });
  }

  static TunesSearchLocalizations of(BuildContext context) {
    return Localizations.of<TunesSearchLocalizations>(
        context, TunesSearchLocalizations);
  }

  String get title {
    return Intl.message(
      'Tune Search',
      name: 'title',
      desc: 'Title for the application',
    );
  }

  String get titleSearch => Intl.message('Search', name: 'titleSearch');
  String get buttonSearch => Intl.message('Search', name: 'buttonSearch');
  String get hintSearch => Intl.message('Search term', name: 'hintSearch');
  String get titleTracks => Intl.message('Tracks', name: 'titleTracks');
  String get alertTitle => Intl.message('Error', name: 'alertTitle');
}
