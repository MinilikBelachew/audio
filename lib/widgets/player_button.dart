import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
    required this.audioPlayer,
  });
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                  onPressed: audioPlayer.hasPrevious
                      ? audioPlayer.seekToPrevious
                      : null,
                  icon: Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                  ));
            }),
        StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final playerState = snapshot.data;
                final processingState =
                    playerState!.processingState;
                if (processingState == ProcessingState.loading ||
                    processingState == ProcessingState.buffering) {
                  return Container(
                    width: 65,
                    height: 65,
                    margin: EdgeInsets.all(10),
                    child: CircularProgressIndicator(),
                  );
                } else if (!audioPlayer.playing) {
                  return IconButton(
                    onPressed: audioPlayer.play,
                    icon: Icon(
                      size: 75,
                      Icons.play_circle,
                      color: Colors.white,
                    ),
                  );
                } else if (processingState != ProcessingState.completed) {
                  return IconButton(
                    onPressed: audioPlayer.pause,
                    icon: Icon(
                      size: 75,
                      Icons.pause_circle,
                      color: Colors.white,
                    ),
                  );
                } else {
                  return IconButton(
                      onPressed: () => audioPlayer.seek(Duration.zero,
                          index: audioPlayer.effectiveIndices!.first),
                      icon: Icon(
                        Icons.replay_circle_filled_outlined,
                        color: Colors.white,
                        size: 75,
                      ));
                }
              } else {
                return CircularProgressIndicator();
              }
            },
        ),
        StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                  onPressed: audioPlayer.hasPrevious
                      ? audioPlayer.seekToNext
                      : null,
                  icon: Icon(
                    Icons.skip_next,
                    color: Colors.white,
                  ));
            }),
      ],
    );
  }
}
