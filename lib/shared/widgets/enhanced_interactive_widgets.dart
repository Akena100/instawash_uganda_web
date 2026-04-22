import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Scroll progress indicator shown at top of page
class ScrollProgressIndicator extends StatefulWidget {
  const ScrollProgressIndicator({super.key});

  @override
  State<ScrollProgressIndicator> createState() => _ScrollProgressIndicatorState();
}

class _ScrollProgressIndicatorState extends State<ScrollProgressIndicator> {
  final double _scrollProgress = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 3,
      child: LinearProgressIndicator(
        value: _scrollProgress,
        minHeight: 3,
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation<Color>(
          Color.lerp(
            const Color(0xFF00AA33),
            const Color(0xFF0066CC),
            _scrollProgress,
          )!,
        ),
      ),
    );
  }
}

/// Wrapper to track scroll and update progress
class ScrollProgressTracker extends StatefulWidget {
  final Widget child;
  final Function(double maxScroll, double currentScroll)? onScroll;

  const ScrollProgressTracker({
    super.key,
    required this.child,
    this.onScroll,
  });

  @override
  State<ScrollProgressTracker> createState() => _ScrollProgressTrackerState();
}

class _ScrollProgressTrackerState extends State<ScrollProgressTracker> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    widget.onScroll?.call(maxScroll, currentScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: widget.child,
    );
  }
}

/// Enhanced feature card with hover effects
class EnhancedFeatureCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;
  final int delayIndex;

  const EnhancedFeatureCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconColor,
    this.onTap,
    this.delayIndex = 0,
  });

  @override
  State<EnhancedFeatureCard> createState() => _EnhancedFeatureCardState();
}

class _EnhancedFeatureCardState extends State<EnhancedFeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = _isHovered 
      ? (isDarkMode ? const Color(0xFF252E3D) : Colors.white)
      : (isDarkMode ? const Color(0xFF1A2332) : Colors.grey[50]);
    final borderColor = _isHovered 
      ? widget.iconColor.withOpacity(0.3) 
      : (isDarkMode ? const Color(0xFF3A4555) : Colors.grey[200]!);
    final textColor = isDarkMode ? const Color(0xFFE8EDF7) : Colors.black87;
    final secondaryTextColor = isDarkMode ? const Color(0xFFB0BAC9) : Colors.grey[600];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(
              color: borderColor,
              width: _isHovered ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? widget.iconColor.withOpacity(0.15)
                    : (isDarkMode ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.08)),
                blurRadius: _isHovered ? 16 : 8,
                offset: _isHovered ? const Offset(0, 8) : const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon container with animation
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: widget.iconColor.withOpacity(_isHovered ? 0.15 : 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.iconColor,
                  size: 28,
                ),
              )
                  .animate()
                  .scaleXY(
                    begin: 0.9,
                    end: _isHovered ? 1.08 : 1.0,
                    duration: 300.ms,
                  )
                  .fadeIn(duration: 300.ms),

              const SizedBox(height: 16),

              // Title
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 8),

              // Description
              Text(
                widget.description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: secondaryTextColor,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 16),

              // Arrow indicator
              if (_isHovered)
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: widget.iconColor,
                      size: 20,
                    )
                        .animate()
                        .fadeIn(duration: 300.ms),
                  ],
                ),
            ],
          ),
        ),
      ),
    )
        .animate()

        .fadeIn(duration: 400.ms);
  }
}
