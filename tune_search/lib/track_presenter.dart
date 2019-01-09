import 'track_entity.dart';
import 'track_view_model.dart';
import 'presenter.dart';

class TrackPresenter implements Presenter<TrackEntity,TrackViewModel>{
  TrackViewModel present(TrackEntity entity) {
    return TrackViewModel('${entity.trackNumber} - ${entity.trackName}',
        entity.artistName, entity.artworkUrl60);
  }
}
