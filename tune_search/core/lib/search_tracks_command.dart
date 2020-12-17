import 'package:tunesearchexample_core_ports/tunesearchexample_core_ports.dart';

import 'collection_entity.dart';

class SearchTracksCommand implements AbstractSearchTracksCommand {
  TunesSearchEngine engine;

  SearchTracksCommand(this.engine);

  @override
  Future<List<TrackCollection>> execute({SearchTerm inDTO}) async =>
      engine.getSongs(inDTO.term).then((value) {
        value.sort();
        var collections = Map<String, TrackCollection>();
        for (var track in value) {
          var collectionName = track.collectionName;
          if (collections[collectionName] == null) {
            collections[collectionName] =
                CollectionEntity(name: collectionName, tracks: <Track>[]);
          }
          collections[collectionName].tracks.add(track);
        }
        return collections.values.toList();
      });

}