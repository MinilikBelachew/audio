import 'package:audio/bottom_nav_bar/favorite.dart';
import 'package:audio/bottom_nav_bar/play_screen.dart';
import 'package:audio/bottom_nav_bar/profile.dart';
import 'package:audio/screens/home_screen.dart';
import 'package:audio/screens/playlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audio/screens/song_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/favorite', page: () => FavoriteScreen()),
        GetPage(name: '/play', page: () => PlayScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/songs', page:() => SongScreen() ),
        GetPage(name: '/playlist', page: () => PlayListone())
        // "/": (context) => const HomeScreen(),  // Replace with your actual screen

        // "/songs": (context) => const SongScreen(),  // Replace with your actual screen
        // "/playlist": (context) => const PlayList(),  // Replace with your actual screen

      ],
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
