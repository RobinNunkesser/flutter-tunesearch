import 'package:flutter/material.dart';
import 'package:tune_search/tune_search_localizations.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _searchview = TextEditingController();
  bool _areButtonsDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TunesSearchLocalizations.of(context).titleSearch),
        actions: [IconButton(icon: Icon(Icons.info),
          onPressed: () => showLicensePage(context: context))],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _searchview,
              decoration: InputDecoration(
                hintText: TunesSearchLocalizations.of(context).hintSearch,
                hintStyle: TextStyle(color: Colors.grey[300]),
              ),
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              child: Text(TunesSearchLocalizations.of(context).buttonSearch),
              onPressed: _areButtonsDisabled ? null : _search,
            )
          ],
        ),
      ),
    );
  }

  void _search() {

  }
}