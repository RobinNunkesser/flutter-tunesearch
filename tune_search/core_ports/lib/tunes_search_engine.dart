import 'package:core_ports/track_entity.dart';

abstract class TunesSearchEngine {
  Future<List<TrackEntity>> getSongs(String term);
}