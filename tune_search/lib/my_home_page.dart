import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'input_boundary.dart';
import 'output_boundary.dart';
import 'interactor.dart';
import 'request.dart';
import 'search_result_view_model.dart';
import 'collection_view_model.dart';
import 'tunes_list_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements OutputBoundary {
  InputBoundary inputBoundary = Interactor();

  bool _areButtonsDisabled = false;
  var _searchview = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
          Material(
            child: TextField(
              controller: _searchview,
              decoration: InputDecoration(
                hintText: "Suchbegriff",
                hintStyle: TextStyle(color: Colors.grey[300]),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          PlatformButton(
            child: Text('Suchen'),
            onPressed: _areButtonsDisabled ? null : _search,
          ),
        ])));
  }

  void _search() {
    inputBoundary.send(
        request: Request(_searchview.text), outputBoundary: this);
    setState(() => _areButtonsDisabled = true);
  }

  @override
  receive({Future response}) {
    response.then((value) {
      setState(() => _areButtonsDisabled = false);
      for (var track in value) {
        debugPrint(track.toString());
      }
      SearchResultViewModel.of(context).collections = <CollectionViewModel>[
        CollectionViewModel(
          'Chapter A',
          <TrackViewModel>[
            TrackViewModel('Section A0'),
            TrackViewModel('Section A1'),
            TrackViewModel('Section A2'),
          ],
        ),
        CollectionViewModel(
          'Chapter B',
          <TrackViewModel>[
            TrackViewModel('Section B0'),
            TrackViewModel('Section B1'),
          ],
        ),
        CollectionViewModel(
          'Chapter C',
          <TrackViewModel>[
            TrackViewModel('Section C0'),
            TrackViewModel('Section C1'),
            TrackViewModel('Section C2'),
          ],
        ),
      ];
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TunesListPage(
                  title: 'Tracks',
                )),
      );
    }).catchError((error) => displayError(context, error));
  }

  Future<void> displayError(BuildContext context, Exception e) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Fehler'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(e.toString()),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
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