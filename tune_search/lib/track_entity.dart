class TrackEntity {
  final String artistName;
  final String collectionName;
  final String trackName;
  final int trackNumber;
  final Uri artworkUrl60;

  TrackEntity({this.artistName,this.collectionName,this.trackName,this.trackNumber,this.artworkUrl60});

  factory TrackEntity.fromJson(Map<String, dynamic> json) {
    return TrackEntity(
      artistName: json['artistName'],
      collectionName: json['collectionName'],
      trackName: json['trackName'],
      trackNumber: json['trackNumber'],
      artworkUrl60: Uri.dataFromString(json['artworkUrl60']),
    );
  }

  @override
  String toString() => '$trackNumber - $trackName';
}