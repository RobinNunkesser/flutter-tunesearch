import 'package:core/search_tracks_command.dart';
import 'package:flutter/material.dart';
import 'package:infrastructure/adapters/tunes_search_engine_adapter.dart';
import 'package:tune_search/adapters/entity_mappings.dart';
import 'package:tune_search/tune_search_localizations.dart';
import 'package:tune_search/tunes_list_page.dart';
import 'package:tunesearchexample_core_ports/tunesearchexample_core_ports.dart';

import 'search_term_dto.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _searchview = TextEditingController();
  bool _areButtonsDisabled = false;
  var searchCommand = SearchTracksCommand(TunesSearchEngineAdapter());

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
    searchCommand
        .execute(
        inDTO: SearchTermDTO(term: _searchview.text))
        .then(success)
        .catchError((error) => failure(error));
    setState(() => _areButtonsDisabled = true);
  }

  void success(List<TrackCollection> collections) {
    setState(() => _areButtonsDisabled = false);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>
          TunesListPage(collections: collections.map((collection) =>
              collection.toCollectionViewModel()).toList())),
    );
  }

  void failure(Exception error) {
    showError(context, error);
  }

  Future<void> showError(BuildContext context, Exception e) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(TunesSearchLocalizations.of(context).alertTitle),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(e.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(MaterialLocalizations.of(context).okButtonLabel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}