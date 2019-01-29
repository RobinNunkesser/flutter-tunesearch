import 'package:tune_search/tune_search.dart';

class CollectionViewModel {
  CollectionViewModel(this.title, [this.tracks = const <TrackViewModel>[]]);
  final String title;
  List<TrackViewModel> tracks;
}