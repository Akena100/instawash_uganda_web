import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:intawashuganda/core/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_colors.dart';
/// GIF-based hero section
/// Displays animated GIF from assets
class YouTubeHeroSection extends StatefulWidget {
  final String? fallbackImagePath;
  final bool isFullWidth;

  const YouTubeHeroSection({
    super.key,
    this.fallbackImagePath = 'assets/logo.png',
    this.isFullWidth = true,
  });

  @override
  State<YouTubeHeroSection> createState() => _YouTubeHeroSectionState();
}

class _YouTubeHeroSectionState extends State<YouTubeHeroSection>
    with TickerProviderStateMixin {
  late AnimationController _marqueeController;

  Future<void> _openWhatsApp() async {
  final uri = Uri.parse(
    '${AppConstants.whatsappUrl}?text=${Uri.encodeComponent('Hello Insta Wash Uganda! I would like to book a service.')}',
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

  @override
  void initState() {
    super.initState();
    _marqueeController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _marqueeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final heroHeight = isMobile ? 300.0 : 550.0;

    return Container(
      width: double.infinity,
      height: heroHeight,
      color: isDarkMode ? const Color(0xFF0F1419) : Colors.black,
      child: ClipRect(
        child: Stack(
          fit: StackFit.passthrough,
          children: [
          // VIDEO LAYER (Background - must be first)
          // Dark background
          Container(
            color: Colors.black,
            width: double.infinity,
            height: heroHeight,
          ),

          // GIF layer (behind everything - no pointer events)
          IgnorePointer(
            child: Container(
              color: Colors.black,
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    'assets/videos/header.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          // OVERLAY LAYERS (On top of video - non-interactive)
          // Primary Gradient Overlay
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.primary.withOpacity(0.4),
                    AppColors.primary.withOpacity(0.6),
                    const Color(0xFF0F1419).withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),

          // Secondary Gradient Overlay (diagonal - non-interactive)
          IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.info.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // CONTENT LAYER (On top of overlays)
          // Content layer with animations
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 16 : 32,
                vertical: isMobile ? 12 : 20,
              ),
              child: isMobile
                  ? SingleChildScrollView(
                      child: _buildHeroContent(isMobile),
                    )
                  : _buildHeroContent(isMobile),
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildHeroContent(bool isMobile) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Premium Badge with glassmorphism
  
        SizedBox(height: isMobile ? 12 : 24),

        // Main Tagline with Marquee Effect
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: AnimatedBuilder(
              animation: _marqueeController,
              builder: (context, child) {
                final offset = _marqueeController.value * 500;
                return Transform.translate(
                  offset: Offset(-offset, 0),
                  child: Row(
                    children: [
                      Text(
                        'YOUR 360° PROFESSIONAL CLEANING COMPANY, ANY TIME, ANYWHERE  •  ',
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 42,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.5,
                          shadows: [
                           
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'YOUR 360° PROFESSIONAL CLEANING COMPANY, ANY TIME, ANYWHERE  •  ',
                        style: TextStyle(
                          fontSize: isMobile ? 20 : 42,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          letterSpacing: 0.5,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        )
            .animate(delay: 100.ms)
            .fadeIn(duration: 600.ms),

        SizedBox(height: isMobile ? 12 : 16),

        // Description
        Text(
          'Professional cleaning services for your home, office, and business needs',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 13 : 18,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.9),
            height: 1.5,
          ),
        )
            .animate(delay: 200.ms)
            .fadeIn(duration: 600.ms),

        SizedBox(height: isMobile ? 16 : 32),

        // CTA Buttons
        Wrap(
          spacing: 12,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            // Primary CTA
            _buildCTAButton(
              label: 'Book Now',
              isPrimary: true,
              onPressed: _openWhatsApp,
            )
                .animate(delay: 300.ms)
                .fadeIn(duration: 600.ms),

            // Secondary CTA
            _buildCTAButton(
              label: 'Get Quote',
              isPrimary: false,
              onPressed: () {
                context.go('/quote');
              },
            )
                .animate(delay: 400.ms)
                .fadeIn(duration: 600.ms),
          ],
        ),
       
      ],
    );
  }

  Widget _buildCTAButton({
    required String label,
    required bool isPrimary,
    required VoidCallback onPressed,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        hoverColor: isPrimary
            ? AppColors.primary.withOpacity(0.2)
            : Colors.white.withOpacity(0.1),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: isPrimary ? AppColors.primary : Colors.transparent,
            border: isPrimary ? null : Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isPrimary ? Colors.white : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
