import 'package:flutter/material.dart';
import 'youtube_player.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Color.fromRGBO(30, 51, 101, 1),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.all(8),
            child: Text(
              "If you are here for the first time then ensure that you have uploaded the list to call from calley Web Panel hosted on https://app.getcalley.com",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          YouTube(),
        ],
      ),
    );
  }
}
