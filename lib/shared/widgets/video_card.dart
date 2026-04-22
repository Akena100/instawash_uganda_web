import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intawashuganda/core/models/video_model.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';

/// Video card widget displaying video thumbnail with hover effects
class VideoCard extends StatefulWidget {
  final Video video;
  final VoidCallback? onTap;
  final double? height;

  const VideoCard({
    super.key,
    required this.video,
    this.onTap,
    this.height,
  });

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: widget.height ?? 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.1),
              width: 1,
            ),
            color: isDarkMode ? const Color(0xFF1A2332) : Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                // Thumbnail image
                Container(
                  color: Colors.black,
                  child: Image.network(
                    widget.video.thumbnailUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: isDarkMode
                            ? const Color(0xFF0F1419)
                            : Colors.grey[300],
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: isDarkMode
                            ? const Color(0xFF0F1419)
                            : Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.video_library, size: 48),
                        ),
                      );
                    },
                  ),
                ),

                // Play button overlay
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 32,
                    ),
                  )
                      .animate(target: _isHovered ? 1 : 0)
                      .scale(begin: const Offset(1, 1), end: const Offset(1.15, 1.15))
                      .fade(begin: 0.7, end: 1.0),
                ),

                // Gradient overlay
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
