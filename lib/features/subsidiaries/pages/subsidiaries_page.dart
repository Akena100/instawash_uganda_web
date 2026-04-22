import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class SubsidiariesPage extends StatelessWidget {
  const SubsidiariesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return FixedHeaderLayout(
      backgroundColor:
          isDarkMode ? const Color(0xFF0F1419) : AppColors.white,
      child: Column(
        children: [

            // Hero Section
            Container(
              width: double.infinity,
              height: isMobile ? 400 : 500,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '🏢',
                        style: const TextStyle(fontSize: 80),
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .scale(),
                      const SizedBox(height: 16),
                      Text(
                        'Our Subsidiaries',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 32 : 44,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                          .animate(delay: 100.ms)
                          .fadeIn(duration: 600.ms)
                          .slideY(begin: 0.2),
                      const SizedBox(height: 12),
                      Text(
                        'Comprehensive solutions across multiple service sectors',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withOpacity(0.9),
                        ),
                        textAlign: TextAlign.center,
                      )
                          .animate(delay: 200.ms)
                          .fadeIn(duration: 600.ms),
                    ],
                  ),
                ),
              ),
            ),

            // Main Subsidiaries Section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Brands',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode
                          ? const Color(0xFFE8EDF7)
                          : AppColors.darkGrey,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms),
                  const SizedBox(height: 8),
                  Container(
                    width: 60,
                    height: 4,
                    decoration: BoxDecoration(
                      gradient: AppColors.primaryGradient,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  )
                      .animate()
                      .scaleX(duration: 600.ms),
                  const SizedBox(height: 40),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 1 : (screenWidth > 1200 ? 3 : 2),
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: isMobile ? 1.0 : 1.1,
                    children: [
                      _SubsidiaryCard(
                        emoji: '�',
                        title: 'Insta Wash Mobile',
                        subtitle: 'Service Booking App',
                        description:
                            'Mobile application for convenient booking of all our services. Schedule cleaning, waste management, security, and shopping services with just a few taps.',
                        color: AppColors.primary,
                        services: [
                          'Easy Booking',
                          'Real-Time Tracking',
                          'Payment Options',
                          'Customer Support',
                        ],
                        onLearnMore: () {},
                        delay: 0,
                      ),
                      _SubsidiaryCard(
                        emoji: '🛡️',
                        title: 'Insta Shield',
                        subtitle: 'Professional Security Services',
                        description:
                            'Comprehensive security and protective services for your home and business. Trained security personnel ensuring safety and peace of mind.',
                        color: const Color(0xFF6366F1),
                        services: [
                          'Security Patrols',
                          'Alarm Systems',
                          'Surveillance',
                          'Access Control',
                        ],
                        onLearnMore: () {},
                        delay: 100,
                      ),
                      _SubsidiaryCard(
                        emoji: '♻️',
                        title: 'Insta Trash',
                        subtitle: 'Eco-Friendly Waste Management',
                        description:
                            'Sustainable waste management and recycling solutions. We handle your waste responsibly while protecting the environment for future generations.',
                        color: AppColors.secondary,
                        services: [
                          'Waste Pickup',
                          'Recycling Programs',
                          'Proper Sorting',
                          'Environmental Impact',
                        ],
                        onLearnMore: () => context.go('/waste'),
                        delay: 200,
                      ),
                      _SubsidiaryCard(
                        emoji: '🛍️',
                        title: 'Insta Shop',
                        subtitle: 'E-Commerce & Retail Solutions',
                        description:
                            'Your one-stop shop for cleaning supplies, equipment, and maintenance products. Quality items delivered directly to your doorstep.',
                        color: const Color(0xFFF59E0B),
                        services: [
                          'Cleaning Supplies',
                          'Equipment Rental',
                          'Fast Delivery',
                          'Expert Advice',
                        ],
                        onLearnMore: () {},
                        delay: 300,
                      ),
                      _SubsidiaryCard(
                        emoji: '📺',
                        title: 'The Ultimate Cleaning Show',
                        subtitle: 'Educational & Entertainment Content',
                        description:
                            'Engaging video content, tips, and tutorials on professional cleaning techniques, home maintenance, and industry insights. Educational entertainment for all.',
                        color: const Color(0xFFEF4444),
                        services: [
                          'Video Tutorials',
                          'Industry Tips',
                          'Behind The Scenes',
                          'Expert Interviews',
                        ],
                        onLearnMore: () {},
                        delay: 400,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Features Grid
            Container(
              width: double.infinity,
              color: isDarkMode
                  ? const Color(0xFF1A2332)
                  : AppColors.lightGrey,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                children: [
                  Text(
                    'Why Choose Our Subsidiaries?',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode
                          ? const Color(0xFFE8EDF7)
                          : AppColors.darkGrey,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms),
                  const SizedBox(height: 40),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 1 : (screenWidth > 1200 ? 3 : 2),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: isMobile ? 2.6 : 2.2,
                    children: [
                      _FeatureCard(
                        icon: '⚡',
                        title: 'Fast & Efficient',
                        description:
                            'Quick response times and professional execution across all services',
                        delay: 0,
                        isDarkMode: isDarkMode,
                      ),
                      _FeatureCard(
                        icon: '👥',
                        title: 'Expert Teams',
                        description:
                            'Trained and certified professionals dedicated to excellence',
                        delay: 100,
                        isDarkMode: isDarkMode,
                      ),
                      _FeatureCard(
                        icon: '💚',
                        title: 'Eco-Friendly',
                        description:
                            'Sustainable practices at the core of everything we do',
                        delay: 200,
                        isDarkMode: isDarkMode,
                      ),
                      _FeatureCard(
                        icon: '💰',
                        title: 'Affordable Pricing',
                        description:
                            'Competitive rates without compromising on quality',
                        delay: 300,
                        isDarkMode: isDarkMode,
                      ),
                      _FeatureCard(
                        icon: '✅',
                        title: 'Quality Guaranteed',
                        description:
                            'We stand behind our work with satisfaction guarantees',
                        delay: 400,
                        isDarkMode: isDarkMode,
                      ),
                      _FeatureCard(
                        icon: '📞',
                        title: '24/7 Support',
                        description:
                            'Round-the-clock customer service for your peace of mind',
                        delay: 500,
                        isDarkMode: isDarkMode,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Stats Section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                children: [
                  Text(
                    'Our Track Record',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode
                          ? const Color(0xFFE8EDF7)
                          : AppColors.darkGrey,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms),
                  const SizedBox(height: 40),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 2 : 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.2,
                    children: [
                      _StatCard(
                        number: '5+',
                        label: 'Years Experience',
                        delay: 0,
                      ),
                      _StatCard(
                        number: '2000+',
                        label: 'Happy Clients',
                        delay: 100,
                      ),
                      _StatCard(
                        number: '150+',
                        label: 'Professional Staff',
                        delay: 200,
                      ),
                      _StatCard(
                        number: '10000+',
                        label: 'Projects Completed',
                        delay: 300,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // CTA Section
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              padding: EdgeInsets.all(isMobile ? 24 : 40),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Ready to Experience Excellence?',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms),
                  const SizedBox(height: 16),
                  Text(
                    'Discover which of our subsidiaries best fits your needs',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate(delay: 100.ms)
                      .fadeIn(duration: 600.ms),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    alignment: WrapAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.go('/services'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Explore Services',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                          .animate(delay: 200.ms)
                          .fadeIn(duration: 600.ms),
                      OutlinedButton(
                        onPressed: () => context.go('/contact'),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                          foregroundColor: AppColors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Get In Touch',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                          .animate(delay: 300.ms)
                          .fadeIn(duration: 600.ms),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
    );
  }
}

class _SubsidiaryCard extends StatefulWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final List<String> services;
  final VoidCallback onLearnMore;
  final int delay;

  const _SubsidiaryCard({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.services,
    required this.onLearnMore,
    required this.delay,
  });

  @override
  State<_SubsidiaryCard> createState() => _SubsidiaryCardState();
}

class _SubsidiaryCardState extends State<_SubsidiaryCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: _isHovered
            ? (Matrix4.identity()..translate(0, -8))
            : Matrix4.identity(),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1A2332) : AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.color.withOpacity(0.2),
            width: 2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.3),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      isDarkMode ? 0.3 : 0.05,
                    ),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.emoji,
                style: const TextStyle(fontSize: 56),
              )
                  .animate(delay: Duration(milliseconds: widget.delay))
                  .fadeIn(duration: 600.ms),
              const SizedBox(height: 16),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: widget.color,
                ),
              )
                  .animate(delay: Duration(milliseconds: widget.delay + 100))
                  .fadeIn(duration: 600.ms),
              const SizedBox(height: 8),
              Text(
                widget.subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode
                      ? const Color(0xFFB0BED9)
                      : AppColors.mediumGrey,
                ),
              )
                  .animate(delay: Duration(milliseconds: widget.delay + 200))
                  .fadeIn(duration: 600.ms),
              const SizedBox(height: 16),
              Text(
                widget.description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: isDarkMode
                      ? const Color(0xFFB0BED9)
                      : AppColors.mediumGrey,
                  height: 1.6,
                ),
              )
                  .animate(delay: Duration(milliseconds: widget.delay + 300))
                  .fadeIn(duration: 600.ms),
              const SizedBox(height: 20),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.services
                    .map(
                      (service) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: widget.color.withOpacity(0.1),
                          border: Border.all(
                            color: widget.color.withOpacity(0.3),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          service,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: widget.color,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
                  .animate(delay: Duration(milliseconds: widget.delay + 400))
                  .fadeIn(duration: 600.ms),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onLearnMore,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.color,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Learn More',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
                  .animate(delay: Duration(milliseconds: widget.delay + 500))
                  .fadeIn(duration: 600.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final int delay;
  final bool isDarkMode;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.delay,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF0F1419) : AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode
              ? const Color(0xFF2A3F5F)
              : AppColors.lightGrey,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 32),
          )
              .animate(delay: Duration(milliseconds: delay))
              .fadeIn(duration: 600.ms),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: isDarkMode
                  ? const Color(0xFFE8EDF7)
                  : AppColors.darkGrey,
            ),
          )
              .animate(delay: Duration(milliseconds: delay + 100))
              .fadeIn(duration: 600.ms),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isDarkMode
                  ? const Color(0xFFB0BED9)
                  : AppColors.mediumGrey,
              height: 1.4,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )
              .animate(delay: Duration(milliseconds: delay + 200))
              .fadeIn(duration: 600.ms),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final int delay;

  const _StatCard({
    required this.number,
    required this.label,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.secondary.withOpacity(0.1),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            )
                .animate(delay: Duration(milliseconds: delay))
                .fadeIn(duration: 600.ms)
                .scaleY(duration: 600.ms),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: isDarkMode
                    ? const Color(0xFFB0BED9)
                    : AppColors.mediumGrey,
              ),
            )
                .animate(delay: Duration(milliseconds: delay + 100))
                .fadeIn(duration: 600.ms),
          ],
        ),
      ),
    );
  }
}
