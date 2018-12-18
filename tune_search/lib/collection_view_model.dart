import 'track_view_model.dart';

class CollectionViewModel {
  CollectionViewModel(this.title, [this.tracks = const <TrackViewModel>[]]);
  final String title;
  List<TrackViewModel> tracks;
}