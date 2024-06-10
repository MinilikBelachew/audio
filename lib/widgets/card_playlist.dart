import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/play_list.dart';

class cardplaylist extends StatelessWidget {
  const cardplaylist({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {

    return InkWell(

      onTap: (){
        Get.toNamed('./playlist',arguments: playlist);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent.shade700.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)
        ),
        height: 75,
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRect(
              child: Image.asset(

                playlist.imageuRL,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playlist.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    maxLines:2,
                    '${playlist.songs.length} songs' ,

                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(
                        fontWeight: FontWeight.bold),
                  ),

                ],
              ),

            ),
              IconButton(
              icon: Icon(Icons.play_circle_outline,color: Colors.white,),
      onPressed: (){

      },
      )

          ],
        ),
      ),
    );
  }
}