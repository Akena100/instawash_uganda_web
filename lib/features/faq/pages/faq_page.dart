import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  String _activeSection = '';

  final List<FAQSection> sections = [
    FAQSection(
      title: 'General Information',
      icon: '📋',
      faqs: [
        FAQ(
          question: 'What is Insta Wash Uganda?',
          answer:
              'Insta Wash Uganda is a professional cleaning service provider offering mobile and on-site cleaning solutions for homes, offices, vehicles, and more. We combine convenience, professionalism, and eco-friendly practices.',
        ),
        FAQ(
          question: 'What makes Insta Wash Uganda different?',
          answer:
              'We combine convenience, professionalism, and eco-friendly cleaning practices. With our app, you can schedule, manage, and pay for cleaning services seamlessly.',
        ),
      ],
    ),
    FAQSection(
      title: 'Getting Started',
      icon: '🚀',
      faqs: [
        FAQ(
          question: 'How do I download the Insta Wash Uganda app?',
          answer:
              'You can download the app from the Google Play Store for Android or the Apple App Store for iOS.',
        ),
        FAQ(
          question: 'How do I create an account?',
          answer:
              'Open the app, click on "Sign Up," and provide your name, phone number, email, and password. You can also sign up using your Google or Facebook account.',
        ),
        FAQ(
          question: 'Do I need to verify my account?',
          answer:
              'Yes, you will receive a verification code via SMS or email to activate your account.',
        ),
      ],
    ),
    FAQSection(
      title: 'Services',
      icon: '🧼',
      faqs: [
        FAQ(
          question: 'What cleaning services are offered?',
          answer:
              'We provide: Vehicle cleaning (interior and exterior), Home cleaning (general, deep cleaning, and specialized services), Office cleaning, Carpet and upholstery cleaning, Laundry and dry cleaning services.',
        ),
        FAQ(
          question: 'Can I customize my cleaning request?',
          answer:
              'Yes, during the booking process, you can specify your needs, such as areas to focus on, preferred cleaning agents, and additional services.',
        ),
        FAQ(
          question: 'Do you offer recurring cleaning services?',
          answer:
              'Yes, you can schedule weekly, bi-weekly, or monthly cleaning services via the app.',
        ),
      ],
    ),
    FAQSection(
      title: 'Booking & Payment',
      icon: '💳',
      faqs: [
        FAQ(
          question: 'How do I book a cleaning service?',
          answer:
              '1. Open the app and log in.\n2. Select the service you need.\n3. Choose the date, time, and location.\n4. Confirm your booking.',
        ),
        FAQ(
          question: 'Can I reschedule or cancel my booking?',
          answer:
              'Yes, go to "My Bookings" and select the booking you want to modify. You can reschedule or cancel within the policy\'s timeframe.',
        ),
        FAQ(
          question: 'What payment methods are accepted?',
          answer:
              'We accept mobile money, credit/debit cards, and cash on delivery.',
        ),
        FAQ(
          question: 'How far in advance can I book a service?',
          answer: 'You can book services up to 30 days in advance.',
        ),
      ],
    ),
    FAQSection(
      title: 'Quality & Safety',
      icon: '✅',
      faqs: [
        FAQ(
          question: 'Are the cleaning staff trained?',
          answer:
              'Yes, all our staff undergo rigorous training to ensure they meet professional cleaning standards.',
        ),
        FAQ(
          question: 'Do you use safe cleaning products?',
          answer:
              'Absolutely. We use eco-friendly and non-toxic cleaning agents that are safe for children, pets, and the environment.',
        ),
        FAQ(
          question: 'What happens if I am not satisfied with the service?',
          answer:
              'If you\'re unhappy, contact customer support within 24 hours, and we\'ll address your concerns immediately.',
        ),
      ],
    ),
    FAQSection(
      title: 'Support & Contact',
      icon: '📞',
      faqs: [
        FAQ(
          question: 'How can I contact customer support?',
          answer:
              'You can reach us via the in-app chat, email at instawashuganda@gmail.com, or call us at +256 393 242 629.',
        ),
        FAQ(
          question: 'What are your customer support hours?',
          answer:
              'Our support team is available from 8:00 AM to 8:00 PM, Monday to Sunday.',
        ),
      ],
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
                  colors: [AppColors.primary, AppColors.secondary],
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
                        '❓',
                        style: const TextStyle(fontSize: 80),
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .scale(),
                      const SizedBox(height: 20),
                      Text(
                        'Frequently Asked Questions',
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
                        'Find answers to common questions about our services',
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

            // FAQ Content
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
                    FAQSection section = entry.value;
                    bool isActive = _activeSection == section.title;

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
                                    _activeSection =
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
                                            fontSize: 18,
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
                                          color: AppColors.primary,
                                          size: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (isActive)
                                Column(
                                  children: [
                                    Divider(
                                      color: isDarkMode
                                          ? const Color(0xFF2A3F5F)
                                          : AppColors.lightGrey,
                                      height: 1,
                                    ),
                                    ...section.faqs.map((faq) {
                                      return _FAQItemExpanded(
                                        question: faq.question,
                                        answer: faq.answer,
                                        isDarkMode: isDarkMode,
                                      );
                                    }),
                                  ],
                                ),
                            ],
                          ),
                        )
                            .animate(delay: Duration(milliseconds: 100 * index))
                            .fadeIn(duration: 600.ms),
                        const SizedBox(height: 20),
                      ],
                    );
                  }),
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
                    'Still have questions?',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Contact our support team for more assistance',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
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
                      'Contact Support',
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
}

class FAQSection {
  final String title;
  final String icon;
  final List<FAQ> faqs;

  FAQSection({
    required this.title,
    required this.icon,
    required this.faqs,
  });
}

class FAQ {
  final String question;
  final String answer;

  FAQ({required this.question, required this.answer});
}

class _FAQItemExpanded extends StatefulWidget {
  final String question;
  final String answer;
  final bool isDarkMode;

  const _FAQItemExpanded({
    required this.question,
    required this.answer,
    required this.isDarkMode,
  });

  @override
  State<_FAQItemExpanded> createState() => _FAQItemExpandedState();
}

class _FAQItemExpandedState extends State<_FAQItemExpanded> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: widget.isDarkMode
                  ? const Color(0xFFE8EDF7)
                  : AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            widget.answer,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: widget.isDarkMode
                  ? const Color(0xFFB0BED9)
                  : AppColors.mediumGrey,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 12),
          Divider(
            color: widget.isDarkMode
                ? const Color(0xFF2A3F5F)
                : AppColors.lightGrey,
            height: 1,
          ),
        ],
      ),
    );
  }
}
