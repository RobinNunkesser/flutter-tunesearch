import 'package:tunesearchexample_core_ports/track_entity.dart';

import '../result_entity.dart';

extension TrackMapping on Result {
  TrackEntity toTrackEntity() => TrackEntity(
      artistName: this.artistName,
      collectionName: this.collectionName,
      trackName: this.trackName,
      trackNumber: this.trackNumber,
      discNumber: this.discNumber,
      artworkUrl: this.artworkUrl60);
}