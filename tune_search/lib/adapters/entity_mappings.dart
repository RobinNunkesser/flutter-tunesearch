import 'package:tune_search/collection_view_model.dart';
import 'package:tune_search/track_view_model.dart';
import 'package:tunesearchexample_core_ports/tunesearchexample_core_ports.dart';

extension CollectionMapping on TrackCollection {
  CollectionViewModel toCollectionViewModel() => CollectionViewModel(
      title: this.name,
      tracks: this.tracks.map((track) => track.toTrackViewModel()).toList());
}

extension TrackMapping on Track {
  TrackViewModel toTrackViewModel() =>
      TrackViewModel('${this.trackNumber} - ${this.trackName}',
          this.artistName, this.artworkUrl);
}