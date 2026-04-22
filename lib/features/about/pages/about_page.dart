import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<AboutCard> _aboutCards = [
    AboutCard(
      icon: '🚀',
      title: 'Our Mission',
      description:
          'To make clean living effortless across Uganda with premium, reliable and eco-friendly cleaning services for homes, businesses and vehicles.',
    ),
    AboutCard(
      icon: '💡',
      title: 'Our Vision',
      description:
          'To become Uganda’s most trusted cleaning partner by delivering modern care, fast response, and memorable customer experiences.',
    ),
    AboutCard(
      icon: '🤝',
      title: 'Our Values',
      description:
          'Integrity, quality, sustainability and convenience guide everything we do for our customers and communities.',
    ),
  ];

  final List<AboutStat> _stats = [
    AboutStat(
      label: '7+ Years Experience',
      value: 'Trusted service since 2017',
    ),
    AboutStat(label: '500+ Clients', value: 'Happy homes and businesses'),
    AboutStat(label: '1000+ Jobs', value: 'Cleaned and refreshed on demand'),
  ];

  final List<String> _points = [
    'Fast online booking with expert teams.',
    'Eco-conscious cleaning products and disposal.',
    'Flexible service packages for residential, commercial, and industrial customers.',
    'Customer-first support with clear pricing and real-time updates.',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDarkMode ? AppColors.white : AppColors.darkGrey;
    final bodyColor = isDarkMode ? AppColors.darkSecondaryText : AppColors.mediumGrey;
    final sectionBackground = isDarkMode ? AppColors.darkBg : AppColors.lightGrey;
    final cardBackground = isDarkMode ? AppColors.darkCard : AppColors.white;
    final borderColor = isDarkMode ? AppColors.darkBorder : AppColors.borderGrey.withOpacity(0.5);

    return FixedHeaderLayout(
      backgroundColor: sectionBackground,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 50 : 72,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'About Insta Wash Uganda',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 32 : 44,
                    fontWeight: FontWeight.w800,
                    color: AppColors.white,
                  ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 860),
                  child: Text(
                    'We bring premium cleaning and waste services to homes, offices and communities across Uganda. Fast, friendly and eco-aware every step of the way.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 15 : 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.9),
                      height: 1.7,
                    ),
                  ).animate(delay: 100.ms).fadeIn(duration: 600.ms),
                ),
                const SizedBox(height: 28),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: const [
                    _HeroBadge(label: 'Trusted teams', icon: Icons.verified),
                    _HeroBadge(label: 'Eco-friendly', icon: Icons.eco),
                    _HeroBadge(label: 'Quick response', icon: Icons.flash_on),
                  ],
                ).animate(delay: 200.ms).fadeIn(duration: 600.ms),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: const [
                    _StatChip(label: '7+ years', value: 'Experience'),
                    _StatChip(label: '500+ clients', value: 'Satisfied'),
                    _StatChip(label: '1000+ jobs', value: 'Delivered'),
                  ],
                ).animate(delay: 300.ms).fadeIn(duration: 600.ms),
              ],
            ),
          ),

          Container(
            width: double.infinity,
            color: sectionBackground,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 32 : 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Why we exist',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 26 : 34,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                  ),
                ).animate().fadeIn(duration: 500.ms),
                const SizedBox(height: 16),
                Text(
                  'Insta Wash Uganda was built to make clean spaces easy for every household and business. We focus on practical, reliable service with strong local support across the country.',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 15 : 16,
                    fontWeight: FontWeight.w400,
                    color: bodyColor,
                    height: 1.75,
                  ),
                ).animate(delay: 100.ms).fadeIn(duration: 500.ms),
                const SizedBox(height: 28),
                _buildCards(isMobile, titleColor, bodyColor, cardBackground),
                const SizedBox(height: 36),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: cardBackground,
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: borderColor),
                    boxShadow: isDarkMode
                        ? []
                        : [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 24,
                              offset: const Offset(0, 12),
                            ),
                          ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our promise to you',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 22 : 26,
                          fontWeight: FontWeight.w700,
                          color: titleColor,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        'Fast booking, dependable teams and cleaner living without compromise.',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 15 : 16,
                          fontWeight: FontWeight.w400,
                          color: bodyColor,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          ElevatedButton(
                            onPressed: () => context.go('/contact'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondary,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Text(
                              'Contact Us',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () => context.go('/services'),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: AppColors.white.withOpacity(0.18)),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 26,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: Text(
                              'View Services',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 28 : 44,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What makes us different',
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 24 : 30,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                  ),
                ).animate().fadeIn(duration: 500.ms),
                const SizedBox(height: 16),
                _buildPointList(isMobile, bodyColor),
                const SizedBox(height: 42),
                _buildStats(isMobile, titleColor, bodyColor, cardBackground, borderColor),
              ],
            ),
          ),

          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildCards(bool isMobile, Color titleColor, Color bodyColor, Color cardColor) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: _aboutCards.map((card) {
        return SizedBox(
          width: isMobile ? double.infinity : 320,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: titleColor == AppColors.white ? AppColors.darkBorder : AppColors.lightGrey.withOpacity(0.35)),
              boxShadow: titleColor == AppColors.white
                  ? []
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(card.icon, style: const TextStyle(fontSize: 32)),
                const SizedBox(height: 18),
                Text(
                  card.title,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  card.description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: bodyColor,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStats(bool isMobile, Color titleColor, Color bodyColor, Color cardColor, Color borderColor) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: _stats.map((stat) {
        return Container(
          width: isMobile ? double.infinity : 280,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                stat.label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                stat.value,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: titleColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Reliable service for every customer',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: bodyColor,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPointList(bool isMobile, Color bodyColor) {
    return Column(
      children: _points.map((point) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  point,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 15 : 16,
                    fontWeight: FontWeight.w400,
                    color: bodyColor,
                    height: 1.8,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;

  const _StatChip({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class AboutCard {
  final String icon;
  final String title;
  final String description;

  AboutCard({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class AboutStat {
  final String label;
  final String value;

  AboutStat({required this.label, required this.value});
}

class _HeroBadge extends StatelessWidget {
  final String label;
  final IconData icon;

  const _HeroBadge({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.16),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.white, size: 18),
          const SizedBox(width: 10),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
