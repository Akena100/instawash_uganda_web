import 'package:flutter/material.dart';
import 'package:intawashuganda/shared/widgets/app_header.dart';

/// Layout widget that provides a fixed header with scrollable content below
/// This ensures the navigation is always accessible while users scroll
class FixedHeaderLayout extends StatelessWidget {
  final Widget child;
  final bool headerIsTransparent;
  final Color? backgroundColor;

  const FixedHeaderLayout({
    super.key,
    required this.child,
    this.headerIsTransparent = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = backgroundColor ?? 
        (isDarkMode ? const Color(0xFF0F1419) : Colors.white);

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        children: [
          // Fixed header at top
          AppHeader(isTransparent: headerIsTransparent),
          
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
