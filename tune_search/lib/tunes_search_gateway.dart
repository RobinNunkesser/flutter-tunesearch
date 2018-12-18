import 'package:http/http.dart' as http;
import 'dart:convert';
import 'track_entity.dart';

class TunesSearchGateway {

  Future<Iterable<TrackEntity>> fetchData(String searchTerm) async {
    var uri = Uri.https('itunes.apple.com', 'search', {'term':searchTerm,'entity':'song'}).toString();
    try {
      final httpResponse = await http.get(uri);
      final responseJson = json.decode(httpResponse.body);
      var results = responseJson['results'];
      if (results is List) {
        return results.map((track) => TrackEntity.fromJson(track));
      } else {
        return Future.error(Exception('No tracks'));
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}