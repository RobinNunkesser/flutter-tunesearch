import 'package:tunesearchexample_core_ports/track.dart';
import 'package:tunesearchexample_core_ports/track_collection.dart';

class CollectionEntity implements TrackCollection {
  @override
  String name;

  @override
  List<Track> tracks;

  CollectionEntity({this.name, this.tracks});
}
