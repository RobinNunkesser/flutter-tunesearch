class TrackEntity  implements Comparable {
  final String artistName;
  final String collectionName;
  final String trackName;
  final int trackNumber;
  final String artworkUrl60;

  TrackEntity({this.artistName,this.collectionName,this.trackName,this.trackNumber,this.artworkUrl60});

  factory TrackEntity.fromJson(Map<String, dynamic> json) {
    return TrackEntity(
      artistName: json['artistName'],
      collectionName: json['collectionName'],
      trackName: json['trackName'],
      trackNumber: json['trackNumber'],
      artworkUrl60: json['artworkUrl60'],
    );
  }

  @override
  String toString() => '$trackNumber - $trackName';

  @override
  int compareTo(other) {    
    if (other is TrackEntity) {
      if (collectionName==other.collectionName) return trackNumber.compareTo(other.trackNumber);
      return collectionName.compareTo(other.collectionName);
    } else {
      return null;
    }
  }
}