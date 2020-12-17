import 'package:tunesearchexample_core_ports/track.dart';
import 'package:tunesearchexample_core_ports/tunes_search_engine.dart';

import '../itunes_search_api.dart';
import 'tune_mappings.dart';

class TunesSearchEngineAdapter implements TunesSearchEngine {
  var adaptee = ITunesSearchAPI();

  @override
  Future<List<Track>> getSongs(String term) async => adaptee
      .fetchData(term)
      .then((value) => value.map((track) => track.toTrackEntity()).toList());
}
