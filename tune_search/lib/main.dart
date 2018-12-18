import 'package:flutter/material.dart';
import 'my_home_page.dart';
import 'platform_app.dart';
import 'search_result_view_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp(model: SearchResultViewModel()));

class MyApp extends StatelessWidget {
  final SearchResultViewModel model;

  const MyApp({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<SearchResultViewModel>(
      model: model,
      child: PlatformApp(
        title: 'Tune Search',
        home: MyHomePage(title: 'Suche'),
      ),
    );
  }
}
