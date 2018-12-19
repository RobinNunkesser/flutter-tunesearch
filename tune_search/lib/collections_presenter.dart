import 'presenter.dart';
import 'collection_view_model.dart';
import 'track_entity.dart';
import 'track_view_model.dart';

class CollectionsPresenter implements Presenter<List<CollectionViewModel>,List<TrackEntity>> {
  @override
  List<CollectionViewModel> present(List<TrackEntity> entity) {
    Map<String, CollectionViewModel> collections =
          Map<String, CollectionViewModel>();

      entity.sort();

      for (var track in entity) {        
        var collectionName = track.collectionName;
        if (collections[collectionName] == null)
          collections[collectionName] = CollectionViewModel(collectionName,<TrackViewModel>[]);
        collections[collectionName].tracks.add(TrackViewModel(
            '${track.trackNumber} - ${track.trackName}',
            track.artistName,
            track.artworkUrl60));
            
      }
      return collections.values.toList();  }

}