class SongModel {
  late String artistName;
  late String trackName;
  late String artworkUrl100;
  late String previewUrl;
  bool  isplaying = false;

  SongModel(
      {required this.artistName,
      required this.artworkUrl100,
      required this.previewUrl,
      required this.trackName});

  SongModel.extractData(Map<String, dynamic> map) {
    artistName = map["artistName"] ?? "NA";
    trackName = map["trackName"] ?? "NA";
    artworkUrl100 = map["artworkUrl100"] ?? "NA";
    previewUrl = map["previewUrl"] ?? "NA";
  }
}