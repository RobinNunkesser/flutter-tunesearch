library core_ports;

import 'package:core_ports/track_entity.dart';

class CollectionEntity {
  final String name;
  final List<TrackEntity> tracks;

  CollectionEntity(
      {this.name,
        this.tracks});

}

