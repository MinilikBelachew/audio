import 'package:audio/models/play_list.dart';
import 'package:audio/models/song.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import '../widgets/card_playlist.dart';
import '../widgets/card_song.dart';
import '../widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> pickMusic() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: false,
      );

      if (result != null) {
        String filePath = result.files.single.path!;
        print("Selected file: $filePath");
      } else {
        print("User canceled the picker");
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Get.toNamed('/');
        break;
      case 1:
        Get.toNamed('/favorite');
        break;
      case 2:
        Get.toNamed('/play');
        break;
      case 3:
        Get.toNamed('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Playlist> playlist = Playlist.playlist;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.lightBlue.shade900,
            Colors.blue.shade50.withOpacity(0.9),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const AppBarcustom(),
        bottomNavigationBar: NavbarCustom(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const MusicDiscover(),
              TrendingMusic(songs: songs),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const header(title: "Playlist", action: "."),
                    ListView.builder(
                      itemCount: playlist.length,
                      padding: const EdgeInsets.only(top: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return cardplaylist(playlist: playlist[index]);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingMusic extends StatelessWidget {
  const TrendingMusic({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const header(
            title: "Trending Music",
            action: "View More",
          ),
          const SizedBox(height: 2),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return cardsong(songs: songs[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MusicDiscover extends StatelessWidget {
  const MusicDiscover({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 5),
          Text(
            "Enjoy your music",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: "Search ...",
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.grey),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavbarCustom extends StatelessWidget {
  const NavbarCustom({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.lightBlue.shade500,
      unselectedItemColor: Colors.white30,
      selectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline_rounded), label: "Play"),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
      ],
    );
  }
}

class AppBarcustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarcustom({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view),
      actions: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const CircleAvatar(
            backgroundColor: Colors.indigo,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import '../models/play_list.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   late Future<List<Playlist>> playlists;
//   final AudioPlayer _audioPlayer = AudioPlayer();
//
//   @override
//   void initState() {
//     super.initState();
//     playlists = Playlist.getPlaylists();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Music Player'),
//       ),
//       body: FutureBuilder<List<Playlist>>(
//         future: playlists,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No songs found'));
//           } else {
//             return ListView.builder(
//               itemCount: snapshot.data!.first.songs.length,
//               itemBuilder: (context, index) {
//                 final song = snapshot.data!.first.songs[index];
//                 return ListTile(
//                   leading: Image.asset(song.coverUrl, width: 50, height: 50, fit: BoxFit.cover),
//                   title: Text(song.title),
//                   subtitle: Text(song.description),
//                   onTap: () {
//                     _audioPlayer.play(DeviceFileSource(song.url));
//                   },
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     super.dispose();
//   }
// }
