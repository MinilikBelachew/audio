import 'song.dart';

class Playlist {
  late final String title;
  late final List<Song> songs;
  late final String imageuRL;

  Playlist({required this.title, required this.songs, required this.imageuRL});
  static List<Playlist> playlist = [
    Playlist(title: "hip pop", songs: Song.songs, imageuRL: "images/couple.jpg"),


    Playlist(title: "hip pop", songs: Song.songs, imageuRL: "images/butterfly.jpg"),
    Playlist(title: "hip pop", songs: Song.songs, imageuRL: "images/love-story.jpg")
  ];
}
// import 'dart:io';
// import 'package:audio/models/song.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:audioplayers/audioplayers.dart';
//
// class Playlist {
//   final String title;
//   final List<Song> songs;
//   final String imageuRL;
//
//   Playlist({required this.title, required this.songs, required this.imageuRL});
//
//   static Future<List<Song>> loadSongsFromStorage() async {
//     final status = await Permission.storage.request();
//     if (status != PermissionStatus.granted) {
//       throw Exception('Storage permission not granted');
//     }
//
//     Directory? directory = await getExternalStorageDirectory();
//     if (directory == null) {
//       throw Exception('Could not get the external storage directory');
//     }
//
//     final List<FileSystemEntity> files = directory.listSync(recursive: true);
//
//     List<Song> songs = [];
//     for (var file in files) {
//       if (file is File && file.path.endsWith('.mp3')) {
//         songs.add(Song(
//           title: file.path.split('/').last,
//           description: file.path.split('/').last,
//           url: file.path,
//           coverUrl: 'images/default_cover.jpg', // Add a default cover image
//         ));
//       }
//     }
//     return songs;
//   }
//
//   static Future<List<Playlist>> getPlaylists() async {
//     List<Song> songs = await loadSongsFromStorage();
//     return [
//       Playlist(title: "My Music", songs: songs, imageuRL: "images/playlist_cover.jpg"),
//     ];
//   }
// }
