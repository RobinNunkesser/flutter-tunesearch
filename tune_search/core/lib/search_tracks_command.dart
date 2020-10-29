import 'package:tunesearchexample_core_ports/tunesearchexample_core_ports.dart';

class SearchTracksCommand implements AbstractSearchTracksCommand {
  TunesSearchEngine engine;

  SearchTracksCommand(this.engine);


  @override
  Future<List<CollectionEntity>> execute({SearchTracksDTO inDTO}) async {
    return engine.getSongs(inDTO.term).then((value) {
        value.sort();
        var collections = Map<String, CollectionEntity>();
        for (var track in value) {
          var collectionName = track.collectionName;
          if (collections[collectionName] == null)
          collections[collectionName] =
            CollectionEntity(name: collectionName, tracks: <TrackEntity>[]);
      collections[collectionName].tracks.add(track);
    }
    return collections.values.toList();
  });
  }


}