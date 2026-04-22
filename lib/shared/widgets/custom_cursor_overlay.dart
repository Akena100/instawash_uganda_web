import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/providers/cursor_provider.dart';
import 'ripple_widget.dart';

/// Global cursor overlay that shows brush icon and ripple effects
class CustomCursorOverlay extends ConsumerStatefulWidget {
  final Widget child;

  const CustomCursorOverlay({
    super.key,
    required this.child,
  });

  @override
  ConsumerState<CustomCursorOverlay> createState() => _CustomCursorOverlayState();
}

class _CustomCursorOverlayState extends ConsumerState<CustomCursorOverlay> {
  final List<Ripple> _ripples = [];
  DateTime _lastRippleTime = DateTime.now();

  void _addRipple(Offset position) {
    // Throttle ripple creation to every 50ms to avoid too many ripples
    final now = DateTime.now();
    if (now.difference(_lastRippleTime).inMilliseconds < 50) {
      return;
    }
    _lastRippleTime = now;

    const maxRadius = 60.0;
    
    late final Ripple ripple;
    ripple = Ripple(
      // Position the ripple so its center is at the cursor
      position: Offset(position.dx - maxRadius, position.dy - maxRadius),
      duration: const Duration(milliseconds: 800),
      maxRadius: maxRadius,
      color: const Color(0x6600D4FF), // Water/washing effect - cyan blue
      onComplete: () => _removeRipple(ripple),
    );

    setState(() {
      _ripples.add(ripple);
    });
  }

  void _removeRipple(Ripple ripple) {
    setState(() {
      _ripples.remove(ripple);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cursorPos = ref.watch(cursorPositionProvider);

    return MouseRegion(
      onHover: (event) {
        // Update cursor position in provider
        ref.read(cursorPositionProvider.notifier).state = MousePosition(
          x: event.position.dx,
          y: event.position.dy,
        );
        
        // Add ripple effect
        _addRipple(event.position);
      },
      cursor: SystemMouseCursors.none, // Hide default cursor and prevent all nested cursors
      child: Stack(
        children: [
          // Main app content
          widget.child,
          
          // Ripple layer
          Positioned.fill(
            child: IgnorePointer(
              child: Stack(
                children: _ripples,
              ),
            ),
          ),
          
          // Brush cursor image
          Positioned(
            left: cursorPos.x - 32, // Center the image (64px / 2)
            top: cursorPos.y - 32,
            child: IgnorePointer(
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  
                ),
                child: Image.asset(
                  'assets/cursor.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
