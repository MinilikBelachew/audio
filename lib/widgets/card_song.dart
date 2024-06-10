import 'package:audio/models/song.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class cardsong extends StatelessWidget {
  const cardsong({
    super.key,
    required this.songs,
  });

  final Song songs;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){

        Get.toNamed('/songs',arguments: songs);
      },
      child: Container(

         margin: const EdgeInsets.only(right: 10),
        child:
        Stack(


            alignment: Alignment.bottomCenter,
            children: [
          Container(

             width: MediaQuery.of(context).size.width * 0.45,

            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(

                    image: AssetImage(songs.coverUrl), fit: BoxFit.cover),

            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.37,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white.withOpacity(0.8)

            ),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceAround ,
              children: [
                Column(
                  children: [
                    Text(
                      songs.title,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      songs.description,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                    ),
                  ],
                ),
                const Icon(Icons.play_circle_outline,color: Colors.lightBlueAccent,)

              ],
            ),
          ),
        ]),
      ),
    );
  }
}
