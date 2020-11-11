import 'package:http/http.dart' as http;
import 'package:infrastructure/result_entity.dart';

import 'result_entity.dart';

class ITunesSearchAPI {
  var baseUrl = "itunes.apple.com";

  Future<List<Result>> fetchData(String searchTerm) async {
    var uri =
        Uri.https(baseUrl, "search", {'term': searchTerm, 'entity': 'song'})
            .toString();
    return http
        .get(uri)
        .then((value) => resultEntityFromJson(value.body).results);
  }
}
