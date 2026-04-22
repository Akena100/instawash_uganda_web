import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/constants/app_constants.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class LaundryPage extends StatelessWidget {
  const LaundryPage({super.key});
  
  Future<void> _openWhatsApp() async {
  final uri = Uri.parse(
    '${AppConstants.whatsappUrl}?text=${Uri.encodeComponent('Hello Insta Wash Uganda! I would like to book a service.')}',
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return FixedHeaderLayout(
      backgroundColor: isDarkMode ? const Color(0xFF0F1419) : AppColors.white,
      child: Column(
        children: [
            // Hero Section
            Container(
              width: double.infinity,
              height: isMobile ? 400 : 500,
              decoration: BoxDecoration(
                gradient: AppColors.secondaryGradient,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '👕',
                        style: const TextStyle(fontSize: 80),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Professional Laundry Service',
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 32 : 44,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Premium care for your clothes with fast delivery',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white.withOpacity(0.9),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Process Timeline
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'How We Work',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (!isMobile)
                    Row(
                      children: _buildTimeline(),
                    )
                  else
                    Column(
                      children: _buildTimeline(),
                    ),
                ],
              ),
            ),
            // Subscription Plans
            Container(
              width: double.infinity,
              color: AppColors.lightGrey,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subscription Plans',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 1 : 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      _SubscriptionCard(
                        title: 'Starter',
                        items: [
                          '2 pickups/month',
                          'Basic wash & iron',
                          'Stain removal included',
                          'Free delivery',
                        ],
                        onSubscribe: _openWhatsApp,
                      ),
                      _SubscriptionCard(
                        title: 'Premium',
                        items: [
                          'Weekly pickups',
                          'Premium care',
                          'Dry cleaning included',
                          'Express service',
                          'Free delivery',
                        ],
                        onSubscribe: _openWhatsApp,
                        isPopular: true,
                      ),
                      _SubscriptionCard(
                        title: 'Elite',
                        items: [
                          'Unlimited pickups',
                          'Full suite of services',
                          'Priority processing',
                          'Dedicated support',
                          'Same-day service',
                        ],
                        onSubscribe: _openWhatsApp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Features
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Why Choose Our Laundry Service?',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _FeatureChip(icon: '✓', label: 'Gentle on Fabrics'),
                      _FeatureChip(icon: '✓', label: 'Stain Removal'),
                      _FeatureChip(icon: '✓', label: 'Quick Delivery'),
                      _FeatureChip(icon: '✓', label: 'Free Pickup'),
                      _FeatureChip(icon: '✓', label: 'Affordable Rates'),
                      _FeatureChip(icon: '✓', label: 'Professional Care'),
                    ],
                  ),
                ],
              ),
            ),
            // CTA Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                children: [
                  Text(
                    'Subscribe to Our Laundry Service',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => context.go('/services'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primary,
                    ),
                    child: Text(
                      'Get Started',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Footer
            const AppFooter(),
          ],
        ),
    );
  }

  List<Widget> _buildTimeline() {
    final steps = [
      {
        'step': '1',
        'title': 'Pickup',
        'desc': 'Request pickup at your convenience',
        'icon': '🚚'
      },
      {
        'step': '2',
        'title': 'Wash',
        'desc': 'Professional washing & drying',
        'icon': '🧼'
      },
      {
        'step': '3',
        'title': 'Iron',
        'desc': 'Expert ironing & folding',
        'icon': '👕'
      },
      {
        'step': '4',
        'title': 'Delivery',
        'desc': 'Ready for you at home!',
        'icon': '📦'
      },
    ];

    return List.generate(
      steps.length,
      (index) => Expanded(
        child: Column(
          children: [
            Text(
              steps[index]['icon']!,
              style: const TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 12),
            Text(
              steps[index]['title']!,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.darkGrey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              steps[index]['desc']!,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.mediumGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _SubscriptionCard extends StatefulWidget {
  final String title;
  final List<String> items;
  final VoidCallback onSubscribe;
  final bool isPopular;

  const _SubscriptionCard({
    required this.title,
    required this.items,
    required this.onSubscribe,
    this.isPopular = false,
  });

  @override
  State<_SubscriptionCard> createState() => __SubscriptionCardState();
}

class __SubscriptionCardState extends State<_SubscriptionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isPopular
                ? AppColors.primary
                : (_isHovered
                    ? AppColors.primary
                    : AppColors.borderGrey),
            width: widget.isPopular || _isHovered ? 2 : 1,
          ),
          boxShadow: [
            if (_isHovered || widget.isPopular)
              BoxShadow(
                color: AppColors.primary.withOpacity(0.2),
                blurRadius: 20,
              )
          ],
        ),
        transform: Matrix4.identity()
          ..translate(0, _isHovered || widget.isPopular ? -8 : 0),
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
                    color: AppColors.accent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Popular',
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
                  color: AppColors.darkGrey,
                ),
              ),
              const SizedBox(height: 20),
              ...widget.items
                  .map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: AppColors.secondary,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: AppColors.mediumGrey,
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

class _FeatureChip extends StatelessWidget {
  final String icon;
  final String label;

  const _FeatureChip({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.borderGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
