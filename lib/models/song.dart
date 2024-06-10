class Song {
  late final String title;
  late final String description;
  late final String url;
  late final String coverUrl;
  Song(
      {required this.title,
      required this.url,
      required this.coverUrl,
      required this.description});
  static List<Song> songs = [
    Song(
        title: "couple",
        description: "couple",
        url: "audio/one.mp3",
        coverUrl: "images/couple.jpg"),
    Song(
        title: "couple",
        description: "couple",
        url: "audio/two.mp3",
        coverUrl: "images/butterfly.jpg"),
    Song(
        title: "butterfly",
        description: "butterfly",
        url: "audio/three.mp3",
        coverUrl: "images/love-story.jpg"),

  ];
}
// class Song {
//   final String title;
//   final String description;
//   final String url;
//   final String coverUrl;
//
//   Song({required this.title, required this.url, required this.coverUrl, required this.description});
// }