import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Play"),
        backgroundColor: Colors.lightBlueAccent,

      ),
      body: Container(
        decoration: BoxDecoration(

        ),
      ),
    );
  }
}
