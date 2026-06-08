import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/theme/app_colors.dart';

/// Model for testimonial data
class Testimonial {
  final String name;
  final String role;
  final String comment;
  final double rating;
  final String? imageUrl;

  Testimonial({
    required this.name,
    required this.role,
    required this.comment,
    required this.rating,
    this.imageUrl,
  });
}

/// Enhanced interactive testimonial carousel
class TestimonialCarousel extends StatefulWidget {
  final List<Testimonial> testimonials;

  const TestimonialCarousel({
    super.key,
    required this.testimonials,
  });

  @override
  State<TestimonialCarousel> createState() => _TestimonialCarouselState();
}

class _TestimonialCarouselState extends State<TestimonialCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode ? const Color(0xFF1A2332) : Colors.white;
    final textColor = isDarkMode ? const Color(0xFFE8EDF7) : Colors.black87;
    final secondaryTextColor = isDarkMode ? const Color(0xFFB0BAC9) : Colors.grey[600]!;
    final borderColor = isDarkMode ? const Color(0xFF3A4555) : Colors.grey[200]!;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 48,
        vertical: isMobile ? 40 : 60,
      ),
      color: isDarkMode ? const Color(0xFF0F1419) : Colors.white,
      child: Column(
        children: [
          // Header
          Text(
            'What Our Clients Say',
            textAlign: TextAlign.center,
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
            'Join thousands of satisfied customers who trust us',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: secondaryTextColor,
            ),
          )
              .animate(delay: 100.ms)
              .fadeIn(duration: 400.ms),
          const SizedBox(height: 40),

          // Carousel
          SizedBox(
            width: double.infinity,
            child: CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: widget.testimonials.length,
              options: CarouselOptions(
                height: isMobile ? 380 : 320,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.easeInOutCubic,
                enlargeCenterPage: !isMobile,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                enlargeFactor: 0.2,
                scrollPhysics: const BouncingScrollPhysics(),
                viewportFraction: isMobile ? 0.95 : 0.32,
                onPageChanged: (index, reason) {
                  setState(() => _currentIndex = index);
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final testimonial = widget.testimonials[index];
                final isActive = index == _currentIndex;

                return _buildTestimonialCard(
                  testimonial: testimonial,
                  isActive: isActive,
                  isMobile: isMobile,
                  isDarkMode: isDarkMode,
                  bgColor: bgColor,
                  textColor: textColor,
                  secondaryTextColor: secondaryTextColor,
                  borderColor: borderColor,
                );
              },
            ),
          ),

          const SizedBox(height: 32),

          // Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.testimonials.length,
              (index) => GestureDetector(
                onTap: () => _carouselController.animateToPage(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  width: index == _currentIndex ? 28 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: index == _currentIndex
                        ? AppColors.primary
                        : (isDarkMode ? Colors.grey[700] : Colors.grey[300]),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          )
              .animate()
              .fadeIn(duration: 400.ms),

          // Navigation buttons (desktop only)
          if (!isMobile)
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildNavButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: () =>
                        _carouselController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                    isDarkMode: isDarkMode,
                  ),
                  const SizedBox(width: 16),
                  _buildNavButton(
                    icon: Icons.arrow_forward_ios,
                    onPressed: () =>
                        _carouselController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                    isDarkMode: isDarkMode,
                  ),
                ],
              )
                  .animate(delay: 100.ms)
                  .fadeIn(duration: 400.ms),
            ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard({
    required Testimonial testimonial,
    required bool isActive,
    required bool isMobile,
    required bool isDarkMode,
    required Color bgColor,
    required Color textColor,
    required Color secondaryTextColor,
    required Color borderColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isActive ? AppColors.primary : borderColor,
          width: isActive ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isActive
                ? AppColors.primary.withOpacity(0.15)
                : (isDarkMode ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.08)),
            blurRadius: isActive ? 12 : 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rating Stars
            Row(
              children: List.generate(
                5,
                (i) => Icon(
                  i < testimonial.rating.toInt()
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  color: Colors.amber,
                  size: 18,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Comment
            Expanded(
              child: Text(
                testimonial.comment,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode ? secondaryTextColor : Colors.grey[700],
                  height: 1.6,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 20),

            // Client Info
            Row(
              children: [
                // Avatar
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [AppColors.primary, AppColors.info],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      testimonial.name[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Name and role
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        testimonial.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textColor,
                        ),
                      ),
                      Text(
                        testimonial.role,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode ? Colors.grey[400] : Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                // Quote icon
                Icon(
                  Icons.format_quote_rounded,
                  color: AppColors.primary.withOpacity(0.2),
                  size: 24,
                ),
              ],
            ),
          ],
        ),
      ),
    )
        .animate()
        .scaleXY(begin: 0.9, end: 1.0, duration: 300.ms)
        .fadeIn(duration: 300.ms);
  }

  Widget _buildNavButton({
    required IconData icon,
    required VoidCallback onPressed,
    required bool isDarkMode,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDarkMode ? const Color(0xFF252E3D) : Colors.grey[100],
            border: Border.all(
              color: isDarkMode ? const Color(0xFF3A4555) : Colors.grey[300]!,
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            size: 18,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
