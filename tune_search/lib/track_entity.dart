class TrackEntity implements Comparable {
  final String artistName;
  final String collectionName;
  final String trackName;
  final int trackNumber;
  final int discNumber;
  final String artworkUrl60;

  TrackEntity(
      {this.artistName,
      this.collectionName,
      this.trackName,
      this.trackNumber,
      this.discNumber,
      this.artworkUrl60});

  factory TrackEntity.fromJson(Map<String, dynamic> json) {
    return TrackEntity(
      artistName: json['artistName'] as String,
      collectionName: json['collectionName'] as String,
      trackName: json['trackName'] as String,
      trackNumber: json['trackNumber'] as int,
      discNumber: json['discNumber'] as int,
      artworkUrl60: json['artworkUrl60'] as String,
    );
  }

  @override
  String toString() => '$trackNumber - $trackName';

  @override
  int compareTo(other) {
    if (other is TrackEntity) {
      if (collectionName != other.collectionName)
        return collectionName.compareTo(other.collectionName);
      if (discNumber != other.discNumber)
        return discNumber.compareTo(other.discNumber);
      return trackNumber.compareTo(other.trackNumber);
    } else {
      return null;
    }
  }
}
