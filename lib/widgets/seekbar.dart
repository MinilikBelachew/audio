import 'dart:math';

import 'package:flutter/material.dart';

class SeekBarData {
  late final Duration position;
  late final Duration duration;
  SeekBarData({required this.duration, required this.position});
}

class SeekBar extends StatefulWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration>? onChnagedEnd;
  final ValueChanged<Duration>? onChnaged;

  const SeekBar(
      {super.key,
      required this.position,
      required this.duration,
      this.onChnagedEnd,
      this.onChnaged});

  @override
  State<SeekBar> createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  String formatduration(Duration? duration){
    if (duration == null) {
      return '--:--';

    }else {
      String minutes =duration.inMinutes.toString().padLeft(2,'0');
      String seconds=duration.inSeconds.remainder(60).toString();
      return '$minutes : $seconds';
    }
  }

  double? dragvalue;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(formatduration(widget.position)),
        Expanded(
            child: SliderTheme(
          data: SliderTheme.of(context).copyWith(
              trackHeight: 5,
              thumbShape: RoundSliderThumbShape(
                  enabledThumbRadius: 7, disabledThumbRadius: 10),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 19),
              activeTrackColor: Colors.white.withOpacity(0.2),
              inactiveTrackColor: Colors.white,
              thumbColor: Colors.lightBlue,
              overlayColor: Colors.lightBlue),
          child: Slider(
            min: 0.0,
            max: widget.duration.inMicroseconds.toDouble(),
            value: min(dragvalue ?? widget.position.inMicroseconds.toDouble(),
                widget.duration.inMicroseconds.toDouble()),
            onChanged: (value) {
              setState(() {
                dragvalue = value;
              });
              if (widget.onChnaged != null) {
                widget.onChnaged!(Duration(microseconds: value.round()));
              }
            },
            onChangeEnd: (value) {
              if(widget.onChnagedEnd != null) {
                widget.onChnagedEnd!(
                  Duration(
                    microseconds: value.round(),
                  )
                );
              }
              dragvalue=null;
            },
          ),
        ),
        ),
        Text(formatduration(widget.duration)),
      ],
    );
  }
}
