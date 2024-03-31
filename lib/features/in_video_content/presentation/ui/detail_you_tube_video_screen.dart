import 'package:flutter/material.dart';

import '../../../../shared_libraries/common/utils/arguments/detail_you_tube_video_argument.dart';
import '../../../../shared_libraries/dependencies/youtube_player_flutter/youtube_player_flutter.dart';

class DetailYouTubeVideoScreen extends StatefulWidget {
  final DetailYouTubeVideoArgument argument;

  const DetailYouTubeVideoScreen({
    super.key,
    required this.argument,
  });

  @override
  DetailYouTubeVideoScreenState createState() =>
      DetailYouTubeVideoScreenState();
}

class DetailYouTubeVideoScreenState extends State<DetailYouTubeVideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.argument.youTubeId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.argument.youTubeTitle),
      ),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
