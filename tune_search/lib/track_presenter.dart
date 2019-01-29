import 'package:tune_search/tune_search.dart';

class TrackPresenter implements Presenter<TrackEntity,TrackViewModel>{
  TrackViewModel present(TrackEntity entity) {
    return TrackViewModel('${entity.trackNumber} - ${entity.trackName}',
        entity.artistName, entity.artworkUrl60);
  }
}
