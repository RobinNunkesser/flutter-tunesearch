class CollectionViewModel {
  CollectionViewModel(this.title, [this.tracks = const <TrackViewModel>[]]);
  final String title;
  final List<TrackViewModel> tracks;
}

class TrackViewModel {
  TrackViewModel(this.title);

  final String title;
}