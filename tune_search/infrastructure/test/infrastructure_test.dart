import 'package:flutter_test/flutter_test.dart';

import 'package:infrastructure/itunes_search_api.dart';

void main() {
  test('fetch tracks', () async {
    final api = ITunesSearchAPI();
    var tracks = await api.fetchData("Jack Johnson");
    expect(tracks.length, 50);
  });

}
