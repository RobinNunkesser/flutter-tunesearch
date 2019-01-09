import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'input_boundary.dart';
import 'output_boundary.dart';
import 'interactor.dart';
import 'search_request.dart';
import 'search_result_view_model.dart';
import 'tunes_list_page.dart';
import 'collection_view_model.dart';
import 'tune_search_localizations.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    implements OutputBoundary<List<CollectionViewModel>> {
  InputBoundary inputBoundary = Interactor();

  bool _areButtonsDisabled = false;
  var _searchview = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(TunesSearchLocalizations.of(context).titleSearch),
          trailingActions: <Widget>[
            PlatformIconButton(
              onPressed: () => showLicensePage(context: context),
              iosIcon: Icon(
                CupertinoIcons.info,
                size: 28.0,
              ),
              androidIcon: Icon(Icons.info),
            ),
          ],
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
          Material(
            child: TextField(
              controller: _searchview,
              decoration: InputDecoration(
                hintText: TunesSearchLocalizations.of(context).hintSearch,
                hintStyle: TextStyle(color: Colors.grey[300]),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PlatformButton(
            child: Text(TunesSearchLocalizations.of(context).buttonSearch),
            onPressed: _areButtonsDisabled ? null : _search,
          ),
        ])));
  }

  void _search() {
    inputBoundary.send(
        request: SearchRequest(_searchview.text), outputBoundary: this);
    setState(() => _areButtonsDisabled = true);
  }

  @override
  receive({Future<List<CollectionViewModel>> response}) {
    response.then((value) {
      setState(() => _areButtonsDisabled = false);
      SearchResultViewModel.of(context).collections = value;        
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TunesListPage()),
      );
    }).catchError((error) => displayError(context, error));
  }

  Future<void> displayError(BuildContext context, Exception e) async {
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
