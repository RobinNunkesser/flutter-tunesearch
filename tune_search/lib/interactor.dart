import 'input_boundary.dart';
import 'output_boundary.dart';
import 'tunes_search_gateway.dart';
import 'search_request.dart';
import 'collection_view_model.dart';
import 'track_view_model.dart';
import 'track_presenter.dart';

class Interactor implements InputBoundary<SearchRequest> {
  @override
  send({SearchRequest request, OutputBoundary outputBoundary}) async {
    var response =
        TunesSearchGateway().fetchData(request.searchTerm).then((value) {
      Map<String, CollectionViewModel> collections =
          Map<String, CollectionViewModel>();
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
