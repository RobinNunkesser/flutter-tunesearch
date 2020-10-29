
import 'package:tunesearchexample_core_ports/track_entity.dart' as core;

import '../track_entity.dart';

extension TrackMapping on TrackEntity {
  core.TrackEntity toCoreTrackEntity() => core.TrackEntity(
  artistName: this.artistName,
  collectionName: this.collectionName,
  trackName: this.trackName,
  trackNumber: this.trackNumber,
  discNumber: this.discNumber,
  artworkUrl: this.artworkUrl60);

}