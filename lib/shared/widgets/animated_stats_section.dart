import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/theme/app_colors.dart';

/// Animated counter that increments when visible on screen
class AnimatedCounter extends StatefulWidget {
  final int targetValue;
  final String label;
  final String? suffix;
  final Duration duration;

  const AnimatedCounter({
    super.key,
    required this.targetValue,
    required this.label,
    this.suffix,
    this.duration = const Duration(milliseconds: 2000),
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _countAnimation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _countAnimation = IntTween(
      begin: 0,
      end: widget.targetValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
  }

  void _startAnimation() {
    if (!_hasAnimated) {
      _hasAnimated = true;
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('counter-${widget.label}'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.5) {
          _startAnimation();
        }
      },
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _countAnimation,
            builder: (context, child) {
              return Text(
                '${_countAnimation.value}${widget.suffix ?? ''}',
                style: const TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              );
            },
          )
              .animate()
              .scaleXY(begin: 0.8, end: 1.0, duration: 300.ms)
              .fadeIn(duration: 300.ms),
          const SizedBox(height: 8),
          Text(
            widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

/// Stats section with animated counters
class AnimatedStatsSection extends StatelessWidget {
  const AnimatedStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode ? const Color(0xFF0F1419) : Colors.grey[50];
    final textColor = isDarkMode ? const Color(0xFFE8EDF7) : Colors.black87;
    final secondaryTextColor = isDarkMode ? const Color(0xFFB0BAC9) : Colors.grey[600];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: isMobile ? 40 : 60,
      ),
      color: bgColor,
      child: Column(
        children: [
          Text(
            'Why Choose Us',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          )
              .animate()
              .fadeIn(duration: 400.ms),
          const SizedBox(height: 12),
          Text(
            'Trusted by thousands of satisfied customers',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: secondaryTextColor,
            ),
          )
              .animate(delay: 100.ms)
              .fadeIn(duration: 400.ms),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = isMobile ? 2 : 4;
              final itemWidth = (constraints.maxWidth - 24) / crossAxisCount;

              return Wrap(
                spacing: 24,
                runSpacing: 32,
                alignment: WrapAlignment.center,
                children: [
                  SizedBox(
                    width: isMobile ? itemWidth : null,
                    child: const AnimatedCounter(
                      targetValue: 2000,
                      label: 'Happy Clients',
                      suffix: '+',
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms),
                  SizedBox(
                    width: isMobile ? itemWidth : null,
                    child: const AnimatedCounter(
                      targetValue: 5000,
                      label: 'Projects Completed',
                      suffix: '+',
                    ),
                  )
                      .animate(delay: 50.ms)
                      .fadeIn(duration: 400.ms),
                  SizedBox(
                    width: isMobile ? itemWidth : null,
                    child: const AnimatedCounter(
                      targetValue: 15,
                      label: 'Years Experience',
                      suffix: '+',
                    ),
                  )
                      .animate(delay: 100.ms)
                      .fadeIn(duration: 400.ms),
                  SizedBox(
                    width: isMobile ? itemWidth : null,
                    child: const AnimatedCounter(
                      targetValue: 99,
                      label: 'Client Satisfaction',
                      suffix: '%',
                    ),
                  )
                      .animate(delay: 150.ms)
                      .fadeIn(duration: 400.ms),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
