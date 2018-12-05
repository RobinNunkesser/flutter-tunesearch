import 'package:http/http.dart' as http;
import 'dart:convert';
import 'response.dart';

class TunesSearchGateway {

  Future<Response> fetchData(String searchTerm) async {
    Response response;
    var uri = Uri.https('itunes.apple.com', 'search', {'term':searchTerm,'entity':'song'}).toString();
    try {
      final httpResponse = await http.get(uri);
      final responseJson = json.decode(httpResponse.body);
      response = Response.success(responseJson.toString());
    } catch (e) {
      response = Response.failure(e);
    }

    return response;
  }

}