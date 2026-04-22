import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// YouTube video player widget with full controls
class YouTubeVideoPlayer extends StatefulWidget {
  final String youtubeId;
  final String title;
  final double? height;
  final bool autoPlay;

  const YouTubeVideoPlayer({
    super.key,
    required this.youtubeId,
    required this.title,
    this.height,
    this.autoPlay = false,
  });

  @override
  State<YouTubeVideoPlayer> createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;
  late YoutubeMetaData _videoMetaData;

  @override
  void initState() {
    super.initState();
    _videoMetaData = const YoutubeMetaData();
    _initializePlayer();
  }

  void _initializePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: false,
        useHybridComposition: true,
        enableCaption: true,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    // Listen for video metadata changes
    if (mounted && _videoMetaData.duration != Duration.zero) {
      Future.delayed(const Duration(milliseconds: 200)).then((_) {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
          bufferedColor: Colors.grey,
          backgroundColor: Colors.black26,
        ),
        onReady: () {},
        onEnded: (_) {
          // Handle video end
        },
      ),
    );
  }
}
