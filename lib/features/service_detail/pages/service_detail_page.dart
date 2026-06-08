import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intawashuganda/core/models/service_model.dart';
import 'package:intawashuganda/core/providers/providers.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class ServiceDetailPage extends ConsumerWidget {
  final String serviceId;

  const ServiceDetailPage({
    super.key,
    required this.serviceId,
  });
  
  Future<void> _openWhatsApp() async {
  final uri = Uri.parse(
    '${AppConstants.whatsappUrl}?text=${Uri.encodeComponent('Hello Insta Wash Uganda! I would like to book a service.')}',
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}



  Service? _getService(List<Service> services) {
    try {
      return services.firstWhere((s) => s.id == serviceId);
    } catch (_) {
      return null;
    }
  }

  ImageProvider _getImageProvider(String imageUrl) {
    if (imageUrl.startsWith('assets/')) {
      return AssetImage(imageUrl);
    } else {
      return NetworkImage(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final services = ref.watch(servicesProvider);
    final service = _getService(services);
    final isMobile = MediaQuery.of(context).size.width < 800;

    if (service == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Service Not Found')),
        body: const Center(child: Text('Service not found')),
      );
    }

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final pageBackground = isDarkMode ? const Color(0xFF0F1419) : AppColors.white;
    final primaryText = isDarkMode ? const Color(0xFFF1F5FF) : AppColors.darkGrey;
    final secondaryText = isDarkMode ? const Color(0xFFB0BAC9) : AppColors.mediumGrey;

    return FixedHeaderLayout(
      backgroundColor: pageBackground,
      child: Column(
        children: [
            // Hero Image Section
            Container(
              width: double.infinity,
              height: isMobile ? 300 : 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: _getImageProvider(service.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    color: Colors.black.withAlpha(77),
                  ),
                    Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withAlpha(102),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(duration: 600.ms),
            // Content Section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with Category Badge
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withAlpha(25),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                service.category,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              service.name,
                              style: GoogleFonts.poppins(
                                fontSize: isMobile ? 28 : 36,
                                fontWeight: FontWeight.w700,
                                color: AppColors.darkGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        service.icon,
                        style: const TextStyle(fontSize: 48),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Rating and Reviews
                  Row(
                    children: [
                      ...List.generate(5, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(
                            index < service.rating.toInt()
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        );
                      }),
                      const SizedBox(width: 12),
                      Text(
                        '${service.rating}',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryText,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '(${service.reviews} reviews)',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: secondaryText,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Description
                  Text(
                    service.description,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: secondaryText,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Additional Images Gallery
                  if (service.additionalImages.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gallery',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: primaryText,
                          ),
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: isMobile ? 2 : 3,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 1.2,
                          ),
                          itemCount: service.additionalImages.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image: _getImageProvider(service.additionalImages[index]),
                                fit: BoxFit.cover,
                              ),
                            )
                                .animate()
                                .fadeIn(
                                  duration: 400.ms,
                                  delay: Duration(milliseconds: index * 50),
                                )
                                .scale(
                                  begin: const Offset(0.9, 0.9),
                                  delay: Duration(milliseconds: index * 50),
                                );
                          },
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  // Key Info Grid
                  Row(
                    children: [
                      Expanded(
                        child: _InfoCard(
                          label: 'Duration',
                          value: service.duration,
                          icon: Icons.schedule_rounded,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  // Features Section
                  Text(
                    'What\'s Included',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: primaryText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...service.features.asMap().entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withAlpha(25),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              Icons.check_rounded,
                              size: 14,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              entry.value,
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: primaryText,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).animate().slideX(begin: -0.2).fadeIn(
                          delay: Duration(milliseconds: entry.key * 100),
                        );
                  }),
                  const SizedBox(height: 40),
                  // Why Choose Us Section
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primary.withAlpha(13),
                          AppColors.info.withAlpha(13),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withAlpha(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Why Choose Us',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: primaryText,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _BenefitItem(
                          title: 'Professional Team',
                          description: 'Trained and certified professionals',
                        ),
                        const SizedBox(height: 12),
                        _BenefitItem(
                          title: 'Quality Assurance',
                          description: 'Guaranteed satisfaction with every service',
                        ),
                        const SizedBox(height: 12),
                        _BenefitItem(
                          title: 'Affordable Pricing',
                          description: 'Best value for your money',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // CTA Buttons
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _openWhatsApp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Book Now',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: () => context.go('/contact'),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.primary,
                          width: 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Contact Us',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),

            // Footer
            const AppFooter(),
          ],
        ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _InfoCard({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDarkMode ? const Color(0xFF17202B) : AppColors.lightGrey;
    final borderColor = isDarkMode ? const Color(0xFF2B3445) : AppColors.borderGrey;
    final primaryText = isDarkMode ? const Color(0xFFF1F5FF) : AppColors.darkGrey;
    final secondaryText = isDarkMode ? const Color(0xFFB0BAC9) : AppColors.mediumGrey;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 24),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: secondaryText,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: primaryText,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2);
  }
}

class _BenefitItem extends StatelessWidget {
  final String title;
  final String description;

  const _BenefitItem({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(
            Icons.check,
            color: Colors.white,
            size: 14,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFFF1F5FF)
                      : AppColors.darkGrey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFFB0BAC9)
                      : AppColors.mediumGrey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
