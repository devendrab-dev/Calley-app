import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTube extends StatelessWidget {
  const YouTube({super.key});

  @override
  Widget build(BuildContext context) {
    final videoId = YoutubePlayer.convertUrlToId(
      "https://youtu.be/l36rG4HafMg?si=kzr0hOPkSXeQyRB2",
    );
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(autoPlay: false, mute: true),
    );
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
        ),
      ),
      child: YoutubePlayer(
        width: double.infinity,
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.grey,
        ),
        bottomActions: [CurrentPosition(), ProgressBar(isExpanded: true)],
        onReady: () {},
      ),
    );
  }
}
