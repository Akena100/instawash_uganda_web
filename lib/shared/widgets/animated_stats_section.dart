import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../core/theme/app_colors.dart';


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
    final secondaryTextColor =
        isDarkMode ? const Color(0xFFB0BAC9) : Colors.grey[600];
    final cardBgColor = const Color(0xFFE3F2FD);

    final equipmentImages = [
      'assets/assets/1.png',
      'assets/assets/2.png',
      'assets/assets/3.png',
      'assets/assets/4.png',
      'assets/assets/5.png',
      'assets/assets/6.png',
      'assets/assets/7.png',
      'assets/assets/8.png',
      'assets/assets/9.png',
      'assets/assets/10.png',
      'assets/assets/11.png',
      'assets/assets/12.png',
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: isMobile ? 40 : 60,
      ),
      color: bgColor,
      child: Column(
        children: [
          Text(
            'Our Modern Machines and Equipment',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ).animate().fadeIn(duration: 400.ms),

          const SizedBox(height: 12),

          Text(
            'We invest in premium cleaning equipment to deliver exceptional results with every service',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: secondaryTextColor,
            ),
          ).animate(delay: 100.ms).fadeIn(duration: 400.ms),

          const SizedBox(height: 48),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 180, // 👈 controls card size
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: equipmentImages.length,
            itemBuilder: (context, index) {
              return EquipmentCard(
                imagePath: equipmentImages[index],
                index: index,
                cardBgColor: cardBgColor,
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Equipment card widget
class EquipmentCard extends StatefulWidget {
  final String imagePath;
  final int index;
  final Color cardBgColor;

  const EquipmentCard({
    required this.imagePath,
    required this.index,
    required this.cardBgColor,
    super.key,
  });

  @override
  State<EquipmentCard> createState() => _EquipmentCardState();
}

class _EquipmentCardState extends State<EquipmentCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 200),
        scale: _isHovering ? 1.05 : 1.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color.fromARGB(255, 68, 150, 232),
            boxShadow: [
              BoxShadow(
                color: _isHovering
                    ? AppColors.primary.withOpacity(0.2)
                    : Colors.black.withOpacity(0.08),
                blurRadius: _isHovering ? 12 : 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16), // 👈 reduced padding
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(
                      Icons.construction,
                      color: AppColors.primary,
                      size: 32,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      )
          .animate(delay: Duration(milliseconds: widget.index * 50))
          .fadeIn(duration: 400.ms)
          .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
    );
  }
}