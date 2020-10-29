import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tune_search/tune_search_localizations.dart';
import 'collection_item.dart';
import 'collection_view_model.dart';

class TunesListPage extends StatefulWidget {
  TunesListPage({Key key,this.collections}) : super(key: key);

  final List<CollectionViewModel> collections;

  @override
  _TunesListPageState createState() => _TunesListPageState();
}

class _TunesListPageState extends State<TunesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TunesSearchLocalizations.of(context).titleTracks),
      ),
      body: SafeArea(child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                CollectionItem(widget.collections[index]),
            itemCount: widget.collections.length,
          )
      ),
    );
  }
}