import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  final List<PrivacySection> sections = [
    PrivacySection(
      title: 'Introduction',
      icon: '📖',
      content:
          'Welcome to Insta Wash Uganda! Your privacy and trust are important to us. This Privacy Policy explains how we collect, use, share, and protect your information.',
    ),
    PrivacySection(
      title: 'Information We Collect',
      icon: '📊',
      content:
          'We collect: Personal Data (name, phone, email), Vehicle Registration Details, Location Data, Usage Data, Photos, Device Data, Financial Data, and Push Notifications.',
    ),
    PrivacySection(
      title: 'How We Use Your Information',
      icon: '🔧',
      content:
          'We use your information for: Account and Service Management, Order Processing, Service Enhancement, Communication and Support, Location-Based Services, Marketing and Promotions, Data Security, and Legal Compliance.',
    ),
    PrivacySection(
      title: 'Sharing of Your Information',
      icon: '🤝',
      content:
          'We share information with: Legal Compliance (when required), Service Providers, Affiliates, Business Transactions, and Marketing Partners.',
    ),
    PrivacySection(
      title: 'Data Transfers',
      icon: '🌐',
      content:
          'Your data may be processed at Insta Wash Uganda\'s main office and other secure locations used by our third-party providers.',
    ),
    PrivacySection(
      title: 'Data Retention',
      icon: '💾',
      content:
          'We retain your information for as long as needed to fulfill the purposes outlined in this Privacy Policy or as required by law.',
    ),
    PrivacySection(
      title: 'Security of Your Information',
      icon: '🔒',
      content:
          'Your data security is our priority. Payments are handled securely by Easy Pay, MTN Mobile Money, and Airtel Money.',
    ),
    PrivacySection(
      title: 'Third-Party Social Integrations',
      icon: '📱',
      content:
          'We integrate with: Facebook, WhatsApp, Instagram, Twitter, LinkedIn, TikTok, and Telegram.',
    ),
    PrivacySection(
      title: 'Children\'s Privacy',
      icon: '🚫',
      content:
          'The Application is intended for users aged 18 and above. We do not knowingly collect information from minors.',
    ),
    PrivacySection(
      title: 'Changes to This Policy',
      icon: '🔄',
      content:
          'We may update this Privacy Policy periodically. Please review it regularly for updates.',
    ),
    PrivacySection(
      title: 'Contact Us',
      icon: '📞',
      content:
          'Phone: +256 393 242 629\nEmail: instawashuganda@gmail.com\nWebsite: www.instawashuganda.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return FixedHeaderLayout(
      backgroundColor:
          isDarkMode ? const Color(0xFF0F1419) : AppColors.white,
      child: Column(
        children: [

            // Hero Section
            Container(
              width: double.infinity,
              height: isMobile ? 350 : 450,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withOpacity(0.7),
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
                        '🔒',
                        style: const TextStyle(fontSize: 80),
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .scale(),
                      const SizedBox(height: 20),
                      Text(
                        'Privacy Policy',
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
                        'We are committed to protecting your privacy',
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

            // Content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...sections.asMap().entries.map((entry) {
                    int index = entry.key;
                    PrivacySection section = entry.value;

                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isDarkMode
                                  ? const Color(0xFF2A3F5F)
                                  : AppColors.lightGrey,
                              width: 1,
                            ),
                            color: isDarkMode
                                ? const Color(0xFF1A2332)
                                : AppColors.lightGrey.withOpacity(0.3),
                          ),
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    section.icon,
                                    style: const TextStyle(fontSize: 28),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      section.title,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                section.content,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: isDarkMode
                                      ? const Color(0xFFB0BED9)
                                      : AppColors.mediumGrey,
                                  height: 1.6,
                                ),
                              ),
                            ],
                          ),
                        )
                            .animate(delay: Duration(milliseconds: 100 * index))
                            .fadeIn(duration: 600.ms)
                            .slideY(begin: 0.1),
                        const SizedBox(height: 20),
                      ],
                    );
                  }),
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

class PrivacySection {
  final String title;
  final String icon;
  final String content;

  PrivacySection({
    required this.title,
    required this.icon,
    required this.content,
  });
}
