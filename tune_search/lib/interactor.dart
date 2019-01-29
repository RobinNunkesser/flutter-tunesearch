import 'package:tune_search/tune_search.dart';

class Interactor implements InputBoundary<SearchRequest> {
  @override
  void send({SearchRequest request, OutputBoundary outputBoundary}) async {
    var response =
        TunesSearchGateway().fetchData(request.searchTerm).then((value) {
      var collections = Map<String, CollectionViewModel>();
      value.sort();          
      for (var track in value) {
        var collectionName = track.collectionName;
        if (collections[collectionName] == null)
          collections[collectionName] =
              CollectionViewModel(collectionName, <TrackViewModel>[]);
        collections[collectionName].tracks.add(TrackPresenter().present(track));
      }
      return collections.values.toList();
    });
    outputBoundary.receive(response: response);
  }
}
