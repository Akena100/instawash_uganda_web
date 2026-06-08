import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class LearnMorePage extends StatelessWidget {
  const LearnMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDarkMode ? AppColors.white : AppColors.darkGrey;
    final bodyColor = isDarkMode ? AppColors.darkSecondaryText : AppColors.mediumGrey;
    final accentColor = isDarkMode ? AppColors.info : AppColors.primary;
    final sectionBackground = isDarkMode ? AppColors.darkBg : AppColors.lightGrey;
    final cardBackground = isDarkMode ? AppColors.darkCard : AppColors.white;

    return FixedHeaderLayout(
      backgroundColor: sectionBackground,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // ===== ANIMATED HERO SECTION =====
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 60 : 100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '✨',
                    style: const TextStyle(fontSize: 64),
                  ).animate().scale(duration: 800.ms),
                  const SizedBox(height: 24),
                  Text(
                    'Discover Insta Wash Uganda',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 32 : 52,
                      fontWeight: FontWeight.w800,
                      color: AppColors.white,
                      height: 1.2,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Text(
                      'Uganda\'s Premier Cleaning, Sanitation & WASTE MANAGEMENT Solution Provider',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 15 : 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withOpacity(0.95),
                        height: 1.6,
                      ),
                    ),
                  ).animate(delay: 100.ms).fadeIn(duration: 600.ms),
                ],
              ),
            ),

            // ===== MISSION & VISION SECTION =====
            Container(
              width: double.infinity,
              color: sectionBackground,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 48 : 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionTitle(
                    isMobile: isMobile,
                    title: 'OUR VISION & MISSION',
                    titleColor: titleColor,
                    accentColor: accentColor,
                  ),
                  const SizedBox(height: 48),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: cardBackground,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: isDarkMode
                                  ? AppColors.darkBorder
                                  : AppColors.borderGrey,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                blurRadius: 20,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Text(
                                    '🎯',
                                    style: const TextStyle(fontSize: 32),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                'OUR VISION',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: accentColor,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'To be the most recognizable and exceptional hygiene, sanitation and cleaning service provider in the region by leveraging modern technologies and equipment.',
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 14 : 16,
                                  fontWeight: FontWeight.w400,
                                  color: bodyColor,
                                  height: 1.8,
                                ),
                              ),
                            ],
                          ),
                        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.3),
                      ),
                      if (!isMobile) const SizedBox(width: 24),
                      if (!isMobile)
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: cardBackground,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isDarkMode
                                    ? AppColors.darkBorder
                                    : AppColors.borderGrey,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.08),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        AppColors.info,
                                        Colors.lightGreen[400] ?? Colors.green,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '💚',
                                      style: const TextStyle(fontSize: 32),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'OUR MISSION',
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: accentColor,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  'To meet the ever growing demand for top-quality hygiene and sanitation services by delivering efficient and reliable cleaning solutions for RESIDENTIAL, COMMERCIAL, automotive and INDUSTRIAL needs through a customer-centric approach.',
                                  style: GoogleFonts.poppins(
                                    fontSize: isMobile ? 14 : 16,
                                    fontWeight: FontWeight.w400,
                                    color: bodyColor,
                                    height: 1.8,
                                  ),
                                ),
                              ],
                            ),
                          ).animate(delay: 100.ms).fadeIn(duration: 600.ms).slideX(begin: 0.3),
                        ),
                    ],
                  ),
                  if (isMobile) const SizedBox(height: 24),
                  if (isMobile)
                    Container(
                      decoration: BoxDecoration(
                        color: cardBackground,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDarkMode
                              ? AppColors.darkBorder
                              : AppColors.borderGrey,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.info,
                                  Colors.lightGreen[400] ?? Colors.green,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                '💚',
                                style: const TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            'OUR MISSION',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: accentColor,
                              letterSpacing: 1.2,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'To meet the ever growing demand for top-quality hygiene and sanitation services by delivering efficient and reliable cleaning solutions for RESIDENTIAL, COMMERCIAL, automotive and INDUSTRIAL needs through a customer-centric approach.',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: bodyColor,
                              height: 1.8,
                            ),
                          ),
                        ],
                      ),
                    ).animate(delay: 100.ms).fadeIn(duration: 600.ms),
                ],
              ),
            ),

            // ===== CORE VALUES SECTION =====
            Container(
              width: double.infinity,
              color: isDarkMode ? AppColors.darkBg : AppColors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 48 : 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionTitle(
                    isMobile: isMobile,
                    title: 'OUR CORE VALUES',
                    titleColor: titleColor,
                    accentColor: accentColor,
                  ),
                  const SizedBox(height: 48),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 1 : 3,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: isMobile ? 1.3 : 1.1,
                    children: [
                      _ValueCard(
                        emoji: '🎯',
                        title: 'Professionalism',
                        description:
                            'We work with exceptional dedication, pride and passion for what we do. We are the ultimate solution to all your cleaning needs.',
                        color: AppColors.primary,
                        isMobile: isMobile,
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 0,
                      ),
                      _ValueCard(
                        emoji: '😊',
                        title: 'Customer Satisfaction',
                        description:
                            'We strive for long-lasting partnerships by ensuring the highest possible standard of excellence and convenience to our clientele.',
                        color: AppColors.info,
                        isMobile: isMobile,
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 100,
                      ),
                      _ValueCard(
                        emoji: '⚡',
                        title: 'Convenience',
                        description:
                            'We recognize that time is essential. We bring the service to you, reversing the norm to create unmatched convenience.',
                        color: const Color(0xFFF59E0B),
                        isMobile: isMobile,
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 200,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ===== COMPETITIVE ADVANTAGES SECTION =====
            Container(
              width: double.infinity,
              color: sectionBackground,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 48 : 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionTitle(
                    isMobile: isMobile,
                    title: 'WHY CHOOSE US',
                    titleColor: titleColor,
                    accentColor: accentColor,
                  ),
                  const SizedBox(height: 48),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 1 : 2,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    childAspectRatio: 1.2,
                    children: [
                      _AdvantageCard(
                        number: '1',
                        title: 'Modern Innovation',
                        description:
                            'State-of-the-art cleaning technologies and the Insta Wash mobile app for seamless service access and booking.',
                        icon: '🚀',
                        isMobile: isMobile,
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 0,
                      ),
                      _AdvantageCard(
                        number: '2',
                        title: 'Mobility & Flexibility',
                        description:
                            'Services delivered to your home, office, or any location. We come to you, not the other way around.',
                        icon: '🚐',
                        isMobile: isMobile,
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 100,
                      ),
                      _AdvantageCard(
                        number: '3',
                        title: 'Experience & Expertise',
                        description:
                            'Over 5 years of proven excellence with portfolio of 20+ satisfied clients and thousands of completed projects.',
                        icon: '⭐',
                        isMobile: isMobile,
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 200,
                      ),
                      _AdvantageCard(
                        number: '4',
                        title: 'Professional Team',
                        description:
                            'Over 100 well-trained employees, specialized in various cleaning techniques and industry standards.',
                        icon: '👥',
                        isMobile: isMobile,
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 300,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ===== OUR SERVICES OVERVIEW =====
            Container(
              width: double.infinity,
              color: isDarkMode ? AppColors.darkBg : AppColors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 48 : 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionTitle(
                    isMobile: isMobile,
                    title: 'OUR SERVICE PORTFOLIO',
                    titleColor: titleColor,
                    accentColor: accentColor,
                  ),
                  const SizedBox(height: 48),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 2 : 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: isMobile ? 1.3 : 1.2,
                    children: [
                      _ServiceTile(
                        emoji: '🚗',
                        title: 'Auto Cleaning',
                        subtitle: 'Mobile & Fleet',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 0,
                        isMobile: isMobile,
                      ),
                      _ServiceTile(
                        emoji: '🏠',
                        title: 'Home Cleaning',
                        subtitle: 'RESIDENTIAL Care',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 100,
                        isMobile: isMobile,
                      ),
                      _ServiceTile(
                        emoji: '🏢',
                        title: 'COMMERCIAL',
                        subtitle: 'Office & Building',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 200,
                        isMobile: isMobile,
                      ),
                      _ServiceTile(
                        emoji: '🏭',
                        title: 'INDUSTRIAL',
                        subtitle: 'Factory & Warehouse',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 300,
                        isMobile: isMobile,
                      ),
                      _ServiceTile(
                        emoji: '🚚',
                        title: 'Laundry',
                        subtitle: 'Mobile Service',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 400,
                        isMobile: isMobile,
                      ),
                      _ServiceTile(
                        emoji: '♻️',
                        title: 'Waste Mgmt',
                        subtitle: 'Eco-Friendly',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        bodyColor: bodyColor,
                        delay: 500,
                        isMobile: isMobile,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ===== EXPERIENCE & TEAM HIGHLIGHT =====
            Container(
              width: double.infinity,
              color: sectionBackground,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 48 : 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _SectionTitle(
                    isMobile: isMobile,
                    title: 'BY THE NUMBERS',
                    titleColor: titleColor,
                    accentColor: accentColor,
                  ),
                  const SizedBox(height: 48),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 2 : 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.2,
                    children: [
                      _StatCard(
                        number: '100+',
                        label: 'Employees',
                        icon: '👥',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        delay: 0,
                        isMobile: isMobile,
                      ),
                      _StatCard(
                        number: '5+',
                        label: 'Years Experience',
                        icon: '📅',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        delay: 100,
                        isMobile: isMobile,
                      ),
                      _StatCard(
                        number: '500+',
                        label: 'Happy Clients',
                        icon: '😊',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        delay: 200,
                        isMobile: isMobile,
                      ),
                      _StatCard(
                        number: '1000+',
                        label: 'Projects Done',
                        icon: '✅',
                        isDarkMode: isDarkMode,
                        cardBackground: cardBackground,
                        delay: 300,
                        isMobile: isMobile,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ===== CTA SECTION =====
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 48 : 80,
              ),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 40,
                vertical: isMobile ? 40 : 56,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ready to Experience Excellence?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ).animate().fadeIn(duration: 600.ms),
                  const SizedBox(height: 16),
                  Text(
                    'Book your service today and discover why thousands trust Insta Wash Uganda',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.95),
                    ),
                  ).animate(delay: 100.ms).fadeIn(duration: 600.ms),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => context.go('/'),
                        icon: const Icon(Icons.home),
                        label: const Text('Back Home'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 28,
                            vertical: isMobile ? 12 : 16,
                          ),
                        ),
                      ).animate(delay: 200.ms).fadeIn(duration: 600.ms),
                      const SizedBox(width: 16),
                      ElevatedButton.icon(
                        onPressed: () => context.go('/services'),
                        icon: const Icon(Icons.build),
                        label: const Text('View Services'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          foregroundColor: AppColors.primary,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 20 : 28,
                            vertical: isMobile ? 12 : 16,
                          ),
                        ),
                      ).animate(delay: 300.ms).fadeIn(duration: 600.ms),
                    ],
                  ),
                ],
              ),
            ),

            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

// ===== HELPER WIDGETS =====

class _SectionTitle extends StatelessWidget {
  final bool isMobile;
  final String title;
  final Color titleColor;
  final Color accentColor;

  const _SectionTitle({
    required this.isMobile,
    required this.title,
    required this.titleColor,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w700,
            color: titleColor,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

class _ValueCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String description;
  final Color color;
  final bool isMobile;
  final bool isDarkMode;
  final Color cardBackground;
  final Color bodyColor;
  final int delay;

  const _ValueCard({
    required this.emoji,
    required this.title,
    required this.description,
    required this.color,
    required this.isMobile,
    required this.isDarkMode,
    required this.cardBackground,
    required this.bodyColor,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? AppColors.darkBorder : AppColors.borderGrey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withOpacity(0.6)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 13 : 14,
              fontWeight: FontWeight.w400,
              color: bodyColor,
              height: 1.6,
            ),
          ),
        ],
      ),
    ).animate(delay: Duration(milliseconds: delay)).fadeIn(duration: 600.ms).slideY(begin: 0.2);
  }
}

class _AdvantageCard extends StatelessWidget {
  final String number;
  final String title;
  final String description;
  final String icon;
  final bool isMobile;
  final bool isDarkMode;
  final Color cardBackground;
  final Color bodyColor;
  final int delay;

  const _AdvantageCard({
    required this.number,
    required this.title,
    required this.description,
    required this.icon,
    required this.isMobile,
    required this.isDarkMode,
    required this.cardBackground,
    required this.bodyColor,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? AppColors.darkBorder : AppColors.borderGrey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.3),
                  ),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                icon,
                style: const TextStyle(fontSize: 32),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColors.white : AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 13 : 14,
              fontWeight: FontWeight.w400,
              color: bodyColor,
              height: 1.6,
            ),
          ),
        ],
      ),
    ).animate(delay: Duration(milliseconds: delay)).fadeIn(duration: 600.ms).slideY(begin: 0.2);
  }
}

class _ServiceTile extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final bool isDarkMode;
  final Color cardBackground;
  final Color bodyColor;
  final int delay;
  final bool isMobile;

  const _ServiceTile({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.isDarkMode,
    required this.cardBackground,
    required this.bodyColor,
    required this.delay,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDarkMode ? AppColors.darkBorder : AppColors.borderGrey.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 15,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColors.white : AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 12 : 13,
              fontWeight: FontWeight.w400,
              color: bodyColor,
            ),
          ),
        ],
      ),
    ).animate(delay: Duration(milliseconds: delay)).fadeIn(duration: 600.ms).slideY(begin: 0.15);
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;
  final String icon;
  final bool isDarkMode;
  final Color cardBackground;
  final int delay;
  final bool isMobile;

  const _StatCard({
    required this.number,
    required this.label,
    required this.icon,
    required this.isDarkMode,
    required this.cardBackground,
    required this.delay,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode ? AppColors.darkBorder : AppColors.borderGrey,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 12),
          Text(
            number,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 12 : 13,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? AppColors.darkSecondaryText : AppColors.mediumGrey,
            ),
          ),
        ],
      ),
    ).animate(delay: Duration(milliseconds: delay)).fadeIn(duration: 600.ms).scale(begin: const Offset(0.8, 0.8));
  }
}
