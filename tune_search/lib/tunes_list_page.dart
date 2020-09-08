import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tune_search/tune_search.dart';

import 'collection_item.dart';

class TunesListPage extends StatefulWidget {
  TunesListPage({Key key}) : super(key: key);
  @override
  _TunesListPageState createState() => _TunesListPageState();
}

class _TunesListPageState extends State<TunesListPage> {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(TunesSearchLocalizations.of(context).titleTracks),
      ),
      body: SafeArea(child: ScopedModelDescendant<SearchResultViewModel>(
        builder: (context, child, model) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                Material(child: CollectionItem(model.collections[index])),
            itemCount: model.collections.length,
          );
        },
      )),
    );
  }
}