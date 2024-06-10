

import 'package:flutter/material.dart';
import 'package:audio/models/play_list.dart';

class PlayListone extends StatefulWidget {
  const PlayListone({super.key});

  @override
  State<PlayListone> createState() => _PlayListoneState();
}

class _PlayListoneState extends State<PlayListone> {
  @override
  Widget build(BuildContext context) {
    Playlist playList = Playlist.playlist[0];
    // List<PlayList> playlist = PlayList.playlist;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.lightBlue.shade900,
          Colors.blue.shade50..withOpacity(0.9)
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Playlist"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _playlist(playList: playList),
                SizedBox(
                  height: 30,
                ),
                Switchshful(),
                listView(playList: playList)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class listView extends StatelessWidget {
  const listView({
    super.key,
    required this.playList,
  });

  final Playlist playList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: playList.songs.length,


        itemBuilder: (context,index) {
        return ListTile(
          leading: Text(
            '${index + 1}',
            style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.bold),
          ),
          title: Text(
            playList.songs[index].title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text('${playList.songs[index].description}= 02:80'),
          trailing: Icon(Icons.more_vert,
          color: Colors.white,),
        );
        });
  }
}

class Switchshful extends StatefulWidget {
  const Switchshful({
    super.key,
  });

  @override
  State<Switchshful> createState() => _SwitchshfulState();
}

bool isPlay = true;

class _SwitchshfulState extends State<Switchshful> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          isPlay = !isPlay;
        });
      },
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
          AnimatedPositioned(
            duration: Duration(microseconds: 200),
            left: isPlay ? 0 : width * 0.45,
            child: Container(
              height: 50,
              width: width * 0.45,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent.shade700,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'play',
                        style: TextStyle(
                            color:
                                isPlay ? Colors.white : Colors.lightBlueAccent,
                            fontSize: 17),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.play_circle,
                      color: isPlay ? Colors.white : Colors.lightBlueAccent,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Shuffle',
                        style: TextStyle(
                            color:
                                isPlay ? Colors.lightBlueAccent : Colors.white,
                            fontSize: 17),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.shuffle,
                      color: isPlay ? Colors.lightBlueAccent : Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
        ),
      ),
    );
  }
}

class _playlist extends StatefulWidget {
  const _playlist({
    super.key,
    required this.playList,
  });

  final Playlist playList;

  @override
  State<_playlist> createState() => _playlistState();
}

class _playlistState extends State<_playlist> {
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
          child: Image.asset(
            widget.playList.imageuRL,
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          widget.playList.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
