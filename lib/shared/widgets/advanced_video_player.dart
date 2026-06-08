import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';

/// Advanced YouTube video player with premium UX
class AdvancedVideoPlayer extends StatefulWidget {
  final String youtubeId;
  final String title;
  final String description;
  final List<dynamic> relatedVideos;
  final Function(String)? onVideoChange;
  final double? height;

  const AdvancedVideoPlayer({
    super.key,
    required this.youtubeId,
    required this.title,
    required this.description,
    required this.relatedVideos,
    this.onVideoChange,
    this.height,
  });

  @override
  State<AdvancedVideoPlayer> createState() => _AdvancedVideoPlayerState();
}

class _AdvancedVideoPlayerState extends State<AdvancedVideoPlayer> {
  late YoutubePlayerController _controller;
  bool _showControls = true;
  bool _isFullscreen = false;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeId,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        useHybridComposition: true,
        enableCaption: true,
        isLive: false,
      ),
    )..addListener(_listener);
  }

  void _listener() {
    if (mounted) {
      setState(() {
      });
    }
  }

  @override
  void didUpdateWidget(AdvancedVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Load new video if the ID changes
    if (oldWidget.youtubeId != widget.youtubeId) {
      // Pause current video before loading new one
      _controller.pause();
      // Load the new video
      _controller.load(widget.youtubeId);
      // Force UI update
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playNextVideo(int index) {
    if (index < widget.relatedVideos.length) {
      final video = widget.relatedVideos[index];
      widget.onVideoChange?.call(video.youtubeId);
      _controller.load(video.youtubeId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main Player Container
        MouseRegion(
          onEnter: (_) => setState(() => _showControls = true),
          onExit: (_) => Future.delayed(Duration(seconds: 3), () {
            if (mounted) setState(() => _showControls = false);
          }),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  // Video Player
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: AppColors.primary,
                      progressColors: ProgressBarColors(
                        playedColor: AppColors.primary,
                        handleColor: AppColors.info,
                        bufferedColor: Colors.grey.withOpacity(0.3),
                        backgroundColor: Colors.black12,
                      ),
                      onReady: () {},
                    ),
                  ),
                  // Custom Overlay Controls
                  if (_showControls && !isMobile)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.transparent,
                              Colors.black.withOpacity(0.4),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Top Control Bar
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Video Title
                                  Expanded(
                                    child: Text(
                                      widget.title,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 4,
                                            color: Colors.black54,
                                          )
                                        ],
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // Info Button
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        shape: BoxShape.circle,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: const Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Bottom Control Bar
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  // Subtitles Button
                                  _ControlButton(
                                    icon: Icons.subtitles_outlined,
                                    tooltip: 'Subtitles',
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 8),
                                  // Settings Button
                                  _ControlButton(
                                    icon: Icons.settings_outlined,
                                    tooltip: 'Settings',
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 8),
                                  // Fullscreen Button
                                  _ControlButton(
                                    icon: _isFullscreen ? Icons.fullscreen_exit : Icons.fullscreen,
                                    tooltip: _isFullscreen ? 'Exit Fullscreen' : 'Fullscreen',
                                    onPressed: () {
                                      setState(() => _isFullscreen = !_isFullscreen);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        // Video Info Section
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF1A2332) : Colors.grey[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: isMobile ? 20 : 28,
                  fontWeight: FontWeight.w800,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              // Stats Row
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.play_circle_outline, color: AppColors.primary, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'Insta Wash',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${DateTime.now().year}',
                    style: TextStyle(
                      color: isDarkMode ? Colors.white.withOpacity(0.6) : Colors.black.withOpacity(0.6),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white.withOpacity(0.7) : Colors.black.withOpacity(0.7),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: _ActionButton(
                      icon: Icons.thumb_up_outlined,
                      label: 'Like',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _ActionButton(
                      icon: Icons.share_outlined,
                      label: 'Share',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _ActionButton(
                      icon: Icons.bookmark_outline,
                      label: 'Save',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        // Related Videos Section
        if (widget.relatedVideos.isNotEmpty && !isMobile)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'More from Insta Wash',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.relatedVideos.length.clamp(0, 5),
                  itemBuilder: (context, index) {
                    final video = widget.relatedVideos[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => _playNextVideo(index),
                          child: Container(
                            width: 240,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
                              ),
                              color: isDarkMode ? const Color(0xFF1A2332) : Colors.grey[50],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                  child: Image.network(
                                    'https://img.youtube.com/vi/${video.youtubeId}/hqdefault.jpg',
                                    width: 240,
                                    height: 100,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, _, _) => Container(
                                      width: 240,
                                      height: 100,
                                      color: Colors.grey[300],
                                      child: const Icon(Icons.image_not_supported),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        video.title,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: isDarkMode ? Colors.white : Colors.black,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Insta Wash',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isDarkMode ? Colors.white.withOpacity(0.6) : Colors.black.withOpacity(0.6),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class _ControlButton extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _ControlButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  State<_ControlButton> createState() => _ControlButtonState();
}

class _ControlButtonState extends State<_ControlButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(_isHovering ? 0.7 : 0.5),
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: Tooltip(
            message: widget.tooltip,
            child: Icon(
              widget.icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: _isHovering ? AppColors.primary : (isDarkMode ? const Color(0xFF1A2332) : Colors.grey[200]),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _isHovering ? AppColors.primary : (isDarkMode ? Colors.grey[800]! : Colors.grey[300]!),
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 18,
                color: _isHovering ? Colors.white : (isDarkMode ? Colors.white : Colors.black),
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: _isHovering ? Colors.white : (isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
