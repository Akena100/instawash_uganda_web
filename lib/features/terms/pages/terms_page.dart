import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  String _activeTerm = '';

  final List<TermsSection> sections = [
    TermsSection(
      title: '1. Definitions and Interpretation',
      icon: '📝',
      content:
          '''Application: The "Insta Wash Uganda" application, downloadable to a device that supports the software.

Application Account: Your account set up to use the Application.

Customer: The person who purchases Services from Insta Wash Uganda.

Services: Vehicle cleaning, Home care, COMMERCIAL cleaning, Garbage collection and disposal, Fumigation, and Pest control.

Subscription: The ongoing agreement under which you pay a fee to receive recurring Services.''',
    ),
    TermsSection(
      title: '2. Basis of Terms & Conditions',
      icon: '⚖️',
      content:
          '''These Conditions apply to all Services provided by Insta Wash Uganda. The agreement is in force:
- For Subscription Services: from the first payment date until termination
- For One-off Services: from the date of payment until completion''',
    ),
    TermsSection(
      title: '3. Provision of Services',
      icon: '🧼',
      content:
          '''We provide Services with reasonable caution and professionalism, including:
- Vehicle Cleaning Services (Exterior, interior, specialized treatments)
- Home Care (General and deep cleaning)
- COMMERCIAL Cleaning (Office spaces, retail outlets)
- Garbage Collection and Disposal
- Fumigation & Pest Control
- Specialized INDUSTRIAL Cleaning''',
    ),
    TermsSection(
      title: '4. Customer Obligations',
      icon: '✋',
      content:
          '''You agree to:
- Comply with Ugandan laws and our guidelines
- Accurately disclose any known defects or issues
- Not make public statements representing us without authorization
- Take responsibility for additional costs from your specific requests''',
    ),
    TermsSection(
      title: '5. Booking & Payment',
      icon: '💳',
      content:
          '''- Prices are subject to change at our discretion
- Payments via cash, debit, or credit card (in-person or app)
- Additional fees may apply for extra work
- Refund process depends on your bank or payment processor''',
    ),
    TermsSection(
      title: '6. Refunds & Cancellation',
      icon: '🔄',
      content:
          '''- Cancellations 24+ hours before booking: 50% cancellation fee applies
- Cancellations within 24 hours: Non-refundable
- No show: No refund
- We may offer refunds at our discretion under special circumstances''',
    ),
    TermsSection(
      title: '7. Limitation of Liability',
      icon: '⚠️',
      content:
          '''Our liability is limited to the fullest extent permitted by law. We are not liable for:
- Indirect, consequential, or incidental damages
- Loss of data, revenue, profits, or use
- Loss or damage to your vehicle, property, or premises''',
    ),
    TermsSection(
      title: '8. Governing Law',
      icon: '🏛️',
      content:
          '''These Terms are governed by the laws of Uganda. Any disputes will be subject to the exclusive jurisdiction of Ugandan courts.''',
    ),
    TermsSection(
      title: '9. Termination',
      icon: '🚫',
      content:
          '''We may terminate Services if you:
- Fail to pay fees
- Violate these terms
- Engage in illegal or unethical conduct
- Act detrimentally to our reputation

You may cancel your Subscription by providing 30 days written notice before the next billing cycle.''',
    ),
    TermsSection(
      title: '10. Customer Support',
      icon: '📞',
      content:
          '''We provide support to address questions, issues, and requests. Contact us through:
- The Application
- Designated Sites
- We respond within 2 Business Days''',
    ),
    TermsSection(
      title: '11. Changes to Terms',
      icon: '🔄',
      content:
          '''We may update these Terms at any time. Changes will be communicated via email or the Application. Continued use of Services after modifications constitutes acceptance of the new Terms. Review this page regularly for updates.''',
    ),
    TermsSection(
      title: '12. Contact Information',
      icon: '📧',
      content:
          '''For inquiries or assistance:
- Email: instawashuganda@gmail.com
- Phone: +256 393 242 629
- Website: www.instawashuganda.com
- In-person at any of our designated Service sites''',
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
                    AppColors.info,
                    AppColors.info.withOpacity(0.7),
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
                        '⚖️',
                        style: const TextStyle(fontSize: 80),
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .scale(),
                      const SizedBox(height: 20),
                      Text(
                        'Terms & Conditions',
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
                        'Please read our Terms and Conditions carefully',
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
                    TermsSection section = entry.value;
                    bool isActive = _activeTerm == section.title;

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
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _activeTerm =
                                        isActive ? '' : section.title;
                                  });
                                },
                                child: Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          section.icon,
                                          style: const TextStyle(fontSize: 28),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          section.title,
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: isDarkMode
                                                ? const Color(0xFFE8EDF7)
                                                : AppColors.darkGrey,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Icon(
                                          isActive
                                              ? Icons.expand_less_rounded
                                              : Icons.expand_more_rounded,
                                          color: AppColors.info,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (isActive)
                                Container(
                                  decoration: BoxDecoration(
                                    color: isDarkMode
                                        ? const Color(0xFF0F1419)
                                        : AppColors.lightGrey.withOpacity(0.3),
                                  ),
                                  child: Column(
                                    children: [
                                      Divider(
                                        color: isDarkMode
                                            ? const Color(0xFF2A3F5F)
                                            : AppColors.lightGrey,
                                        height: 1,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Text(
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
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        )
                            .animate(delay: Duration(milliseconds: 100 * index))
                            .fadeIn(duration: 600.ms),
                        const SizedBox(height: 16),
                      ],
                    );
                  }),
                ],
              ),
            ),

            // Acceptance Notice
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              padding: EdgeInsets.all(isMobile ? 24 : 40),
              decoration: BoxDecoration(
                color: isDarkMode ? const Color(0xFF1A2332) : AppColors.lightGrey,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.info.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.info_rounded,
                        color: AppColors.info,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Important Note',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.info,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'By using the Insta Wash Uganda Application and services, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, please discontinue use of our services.',
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
            ),

            // Footer
            const AppFooter(),
          ],
        ),
    );
  }
}

class TermsSection {
  final String title;
  final String icon;
  final String content;

  TermsSection({
    required this.title,
    required this.icon,
    required this.content,
  });
}
