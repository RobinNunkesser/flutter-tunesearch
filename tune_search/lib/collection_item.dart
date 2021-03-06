import 'package:flutter/material.dart';
import 'package:tune_search/track_view_model.dart';

import 'collection_view_model.dart';

class CollectionItem extends StatelessWidget {
  const CollectionItem(this.entry);

  final CollectionViewModel entry;

  Widget _trackTile(TrackViewModel track) {
    return ListTile(
      title: Text(track.title),
      subtitle: Text(track.subtitle),
      leading: Image.network(track.artworkUrl),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(entry.title),
      children: entry.tracks.map(_trackTile).toList(),
      initiallyExpanded: true,
    );
  }
}
