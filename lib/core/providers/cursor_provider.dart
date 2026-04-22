import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Represents the current mouse position on the screen
class MousePosition {
  final double x;
  final double y;

  MousePosition({required this.x, required this.y});

  @override
  String toString() => 'MousePosition(x: $x, y: $y)';
}

/// Provider to track the current mouse position globally
final cursorPositionProvider = StateProvider<MousePosition>((ref) {
  return MousePosition(x: 0, y: 0);
});

/// Provider to track ripple events (triggers ripple animation at a position)
final rippleEventProvider = StateProvider<MousePosition?>((ref) {
  return null;
});
