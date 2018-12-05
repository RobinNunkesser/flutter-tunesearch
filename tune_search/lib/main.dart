import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'platform_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Tune Search',
      home: MyHomePage(title: 'Suche'),
    );
  }
}

