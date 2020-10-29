import 'package:infrastructure/itunes_search_api.dart';
import 'package:tunesearchexample_core_ports/tunesearchexample_core_ports.dart';
import 'tune_mappings.dart';

class TunesSearchEngineAdapter implements TunesSearchEngine {
  var adaptee = ITunesSearchAPI();

  @override
  Future<List<TrackEntity>> getSongs(String term) async {
    return adaptee.fetchData(term).then((value) => value.map((track) => track.toCoreTrackEntity()).toList());
  }

}