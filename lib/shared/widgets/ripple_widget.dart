import 'package:flutter/material.dart';

/// Single ripple animation widget
class Ripple extends StatefulWidget {
  final Offset position;
  final Duration duration;
  final double maxRadius;
  final Color color;
  final VoidCallback onComplete;

  const Ripple({
    super.key,
    required this.position,
    required this.duration,
    required this.onComplete,
    this.maxRadius = 80,
    this.color = const Color(0x3300AAFF), // Light blue with transparency
  });

  @override
  State<Ripple> createState() => _RippleState();
}

class _RippleState extends State<Ripple> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // Radius expands from 0 to maxRadius
    _radiusAnimation = Tween<double>(begin: 0, end: widget.maxRadius).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Opacity fades from 1 to 0
    _opacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward().whenComplete(() {
      // Notify parent to remove this ripple
      widget.onComplete();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.position.dx,
      top: widget.position.dy,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: RipplePainter(
              radius: _radiusAnimation.value,
              opacity: _opacityAnimation.value,
              color: widget.color,
            ),
            size: Size(
              widget.maxRadius * 2,
              widget.maxRadius * 2,
            ),
          );
        },
      ),
    );
  }
}

/// Custom painter for water ripple effect
class RipplePainter extends CustomPainter {
  final double radius;
  final double opacity;
  final Color color;

  RipplePainter({
    required this.radius,
    required this.opacity,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(opacity * color.opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);

    // Draw secondary ripple for water effect
    if (radius > 10) {
      final secondaryPaint = Paint()
        ..color = color.withOpacity(opacity * 0.5 * color.opacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;
      canvas.drawCircle(center, radius * 0.6, secondaryPaint);
    }
  }

  @override
  bool shouldRepaint(RipplePainter oldDelegate) {
    return oldDelegate.radius != radius || oldDelegate.opacity != opacity;
  }
}
