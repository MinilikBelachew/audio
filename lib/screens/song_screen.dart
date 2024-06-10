import 'package:audio/models/song.dart';
import 'package:audio/widgets/seekbar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../widgets/player_button.dart';

AudioPlayer audioPlayer = AudioPlayer();
Song song = Get.arguments ?? Song.songs[0];

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
      AudioSource.uri(
            Uri.parse('asset:///${Song.songs[1].url}'),
          ),
        ],
      )
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Stream<SeekBarData> get seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration positon,
        Duration? duration,
      ) {
        return SeekBarData(
            duration: duration ?? Duration.zero, position: positon);
      });

  @override
  Widget build(BuildContext context) {
    // AudioPlayer audioPlayer=AudioPlayer();
    // Song song = Song.songs[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            song.coverUrl,
            fit: BoxFit.cover,
          ),
          filterBackground(),
          durationStuff(
            audioPlayer: audioPlayer,
              seekBarDataStream: seekBarDataStream,
          song : song)
        ],
      ),
    );
  }
}

class durationStuff extends StatelessWidget {
  const durationStuff({
    super.key,
    required this.seekBarDataStream,
    required this.song,
    required this.audioPlayer,
  });
  final Song song;
  final AudioPlayer audioPlayer;

  final Stream<SeekBarData> seekBarDataStream;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,
      vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(song.title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          Text(
            song.description,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
          StreamBuilder<SeekBarData>(
              stream: seekBarDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.position ?? Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
                  onChnaged: audioPlayer.seek,
                );
              },
          ),
          PlayerButtons(audioPlayer: audioPlayer,)
        ],
      ),
    );
  }
}


class filterBackground extends StatelessWidget {
  const filterBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.0)
            ],
            stops: [
              0.0,
              0.4,
              0.6
            ]).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.lightBlue.shade200, Colors.blue.shade900])),
      ),
    );
  }
}
