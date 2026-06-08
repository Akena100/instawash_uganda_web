import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
    this.autoPlay = true,
  });

  @override
  State<YouTubeVideoPlayer> createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      flags: YoutubePlayerFlags(
        autoPlay: widget.autoPlay,
        mute: true, // 👈 better UX for autoplay
        loop: false, // we handle looping manually
        hideControls: true,
        disableDragSeek: true,
        controlsVisibleAtStart: false,
      ),
    )..addListener(_loopListener);
  }

  void _loopListener() {
    if (!_controller.value.isReady) return;

    final position = _controller.value.position;

    // 👇 Loop first 10 seconds
    if (position.inSeconds >= 10) {
      _controller.seekTo(const Duration(seconds: 0));
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_loopListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: false,
        progressIndicatorColor: Colors.red,
      ),
    );
  }
}