import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class PlatformApp extends PlatformWidgetBase<CupertinoApp, MaterialApp> {
  final String title;
  final Widget home;
  final Iterable<LocalizationsDelegate> localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final GenerateAppTitle onGenerateTitle;

  PlatformApp({this.title = '', this.home, this.supportedLocales, this.localizationsDelegates, this.onGenerateTitle});

  @override
  MaterialApp createAndroidWidget(BuildContext context) {
    if (supportedLocales == null) {
      return MaterialApp(
        onGenerateTitle: onGenerateTitle,
        title: title,
        home: home,
      );
    } else {
      return MaterialApp(
        onGenerateTitle: onGenerateTitle,
        title: title,
        home: home,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      );
    }
  }

  @override
  CupertinoApp createIosWidget(BuildContext context) {
    if (supportedLocales == null) {
      return CupertinoApp(
        onGenerateTitle: onGenerateTitle,
        title: title,
        home: home,
      );
    } else {
      return CupertinoApp(
        onGenerateTitle: onGenerateTitle,
        title: title,
        home: home,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      );
    }
  }
}
