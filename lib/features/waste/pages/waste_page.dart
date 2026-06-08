import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class WastePage extends StatelessWidget {
  const WastePage({super.key});
  
  Future<void> _openWhatsApp() async {
  final uri = Uri.parse(
    '${AppConstants.whatsappUrl}?text=${Uri.encodeComponent('Hello Insta Wash Uganda! I would like to book a service.')}',
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

  Future<void> _launchWhatsapp() async {
    final uri = Uri.parse('https://wa.me/qr/QYARTG3JEE66P1');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final pageBackground = isDarkMode ? AppColors.darkBg : AppColors.white;
    final sectionBackground = isDarkMode ? AppColors.darkSurface : AppColors.lightGrey;
    final primaryText = isDarkMode ? AppColors.darkText : AppColors.darkGrey;
    final secondaryText = isDarkMode ? AppColors.darkSecondaryText : AppColors.mediumGrey;

    return FixedHeaderLayout(
      backgroundColor: pageBackground,
      child: Column(
        children: [
            // Hero Section
            Container(
              width: double.infinity,
              height: isMobile ? 400 : 500,
              decoration: const BoxDecoration(
                gradient: AppColors.secondaryGradient,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '♻️',
                        style: const TextStyle(fontSize: 80),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Insta Trash',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 32 : 44,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Eco-friendly WASTE MANAGEMENT & recycling solutions',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withAlpha(230),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Overview Section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Insta Trash',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: primaryText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Our WASTE MANAGEMENT service is designed to help individuals and businesses responsibly manage their waste while protecting the environment.',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: secondaryText,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      _OverviewCard(
                        icon: '🌍',
                        title: 'Environmentally Friendly',
                        desc: 'We prioritize sustainable recycling practices',
                      ),
                      _OverviewCard(
                        icon: '📦',
                        title: 'Regular Pickups',
                        desc: 'Scheduled collection at your convenience',
                      ),
                      _OverviewCard(
                        icon: '♻️',
                        title: 'Proper Sorting',
                        desc: 'Expert waste segregation for recycling',
                      ),
                      _OverviewCard(
                        icon: '💚',
                        title: 'Community Impact',
                        desc: 'Contributing to a cleaner Uganda',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Waste Categories Section
            Container(
              width: double.infinity,
              color: sectionBackground,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Waste Categories We Handle',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: primaryText,
                    ),
                  ),
                  const SizedBox(height: 32),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 2 : (isMobile ? 2 : 4),
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      _WasteCategoryCard(
                        icon: '📄',
                        title: 'Paper & Cardboard',
                        color: AppColors.primary,
                      ),
                      _WasteCategoryCard(
                        icon: '🥫',
                        title: 'Metals',
                        color: AppColors.info,
                      ),
                      _WasteCategoryCard(
                        icon: '🪟',
                        title: 'Glass',
                        color: AppColors.accent,
                      ),
                      _WasteCategoryCard(
                        icon: '🛍️',
                        title: 'Plastics',
                        color: AppColors.info,
                      ),
                      _WasteCategoryCard(
                        icon: '🍃',
                        title: 'Organic Waste',
                        color: AppColors.info,
                      ),
                      _WasteCategoryCard(
                        icon: '🇪',
                        title: 'Electronics',
                        color: AppColors.info,
                      ),
                      _WasteCategoryCard(
                        icon: '❌',
                        title: 'Hazardous',
                        color: AppColors.error,
                      ),
                      _WasteCategoryCard(
                        icon: '🎁',
                        title: 'Miscellaneous',
                        color: AppColors.accent,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Subscription Plans
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Plans',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: primaryText,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 1 : 3,
                    childAspectRatio: isMobile ? 2.4 : 1.1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      _WastePlanCard(
                        title: 'Home Plan',
                        bins: '1 bin',
                        frequency: 'Weekly',
                        features: [
                          'Mixed waste collection',
                          'Weekly pickup',
                          'Sorting assistance',
                          'Recycling reports',
                        ],
                        onSubscribe: _openWhatsApp,
                      ),
                      _WastePlanCard(
                        title: 'Business Plan',
                        bins: '2 bins',
                        frequency: 'Twice weekly',
                        features: [
                          'Large capacity bins',
                          'Twice weekly pickup',
                          'Professional sorting',
                          'Full documentation',
                        ],
                        onSubscribe: _openWhatsApp,
                        isPopular: true,
                      ),
                      _WastePlanCard(
                        title: 'Enterprise Plan',
                        bins: 'Multiple',
                        frequency: 'Custom',
                        features: [
                          'Customized bins',
                          'Flexible schedule',
                          'Full recycling',
                          'Dedicated support',
                        ],
                        onSubscribe: _openWhatsApp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Impact Section
            Container(
              width: double.infinity,
              color: sectionBackground,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Environmental Impact',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: primaryText,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 40,
                    runSpacing: 40,
                    alignment: WrapAlignment.spaceAround,
                    children: [
                      _ImpactStat(
                        number: '500+',
                        label: 'Tons Recycled',
                      ),
                      _ImpactStat(
                        number: '1000+',
                        label: 'Families Served',
                      ),
                      _ImpactStat(
                        number: '50+',
                        label: 'Businesses',
                      ),
                      _ImpactStat(
                        number: '95%',
                        label: 'Recycled',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // CTA Section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: AppColors.secondaryGradient,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 40,
                  vertical: 40,
                ),
                child: Column(
                  children: [
                    Text(
                      'Join the Green Revolution',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 24 : 32,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _launchWhatsapp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        foregroundColor: AppColors.info,
                      ),
                      child: Text(
                        'Subscribe Now',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Footer
            const AppFooter(),
          ],
        ),
    );
  }
}

class _OverviewCard extends StatelessWidget {
  final String icon;
  final String title;
  final String desc;

  const _OverviewCard({
    required this.icon,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardBackground = isDarkMode ? AppColors.darkCard : AppColors.white;
    final textColor = isDarkMode ? AppColors.darkText : AppColors.darkGrey;
    final secondaryText = isDarkMode ? AppColors.darkSecondaryText : AppColors.mediumGrey;
    final borderColor = isDarkMode ? AppColors.darkBorder : AppColors.borderGrey;

    return Container(
      width: 250,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class _WasteCategoryCard extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;

  const _WasteCategoryCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(77)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 40)),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _WastePlanCard extends StatefulWidget {
  final String title;
  final String bins;
  final String frequency;
  final List<String> features;
  final VoidCallback onSubscribe;
  final bool isPopular;

  const _WastePlanCard({
    required this.title,
    required this.bins,
    required this.frequency,
    required this.features,
    required this.onSubscribe,
    this.isPopular = false,
  });

  @override
  State<_WastePlanCard> createState() => __WastePlanCardState();
}

class __WastePlanCardState extends State<_WastePlanCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardBackground = isDarkMode ? AppColors.darkCard : AppColors.white;
    final primaryText = isDarkMode ? AppColors.darkText : AppColors.darkGrey;
    final secondaryText = isDarkMode ? AppColors.darkSecondaryText : AppColors.mediumGrey;
    final borderColor = isDarkMode ? AppColors.darkBorder : AppColors.borderGrey;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: cardBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isPopular
                ? AppColors.info
                : (_isHovered
                    ? AppColors.info
                    : borderColor),
            width: widget.isPopular || _isHovered ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isPopular)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.info,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Recommended',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
              const SizedBox(height: 12),
              Text(
                widget.title,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryText,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${widget.bins} • ${widget.frequency}',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: secondaryText,
                ),
              ),
              const SizedBox(height: 20),
              ...widget.features
                  .map(
                    (feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: AppColors.info,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: secondaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  ,
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: widget.onSubscribe,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.info,
                  ),
                  child: Text(
                    'Subscribe',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImpactStat extends StatelessWidget {
  final String number;
  final String label;

  const _ImpactStat({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: GoogleFonts.poppins(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: AppColors.info,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.mediumGrey,
          ),
        ),
      ],
    );
  }
}
