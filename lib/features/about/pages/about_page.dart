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
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDarkMode ? AppColors.white : AppColors.darkGrey;
    final bodyColor = isDarkMode ? AppColors.darkSecondaryText : AppColors.mediumGrey;
    final accentColor = isDarkMode ? AppColors.info : AppColors.primary;
    final sectionBackground = isDarkMode ? AppColors.darkBg : AppColors.lightGrey;
    final cardBackground = isDarkMode ? AppColors.darkCard : AppColors.white;
    final borderColor = isDarkMode ? AppColors.darkBorder : AppColors.borderGrey.withOpacity(0.5);

    return FixedHeaderLayout(
      backgroundColor: sectionBackground,
      child: Column(
        children: [
          // ===== HERO SECTION =====
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 60 : 80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'About Insta Wash Uganda',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 36 : 52,
                    fontWeight: FontWeight.w800,
                    color: AppColors.white,
                    height: 1.2,
                  ),
                ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Text(
                    'Transforming spaces and creating cleaner communities across Uganda since 2020',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.95),
                      height: 1.6,
                    ),
                  ),
                ).animate(delay: 100.ms).fadeIn(duration: 600.ms),
              ],
            ),
          ),

          // ===== WHO WE ARE SECTION =====
          Container(
            width: double.infinity,
            color: sectionBackground,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 48 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(
                  isMobile: isMobile,
                  title: 'WHO WE ARE',
                  titleColor: titleColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Text(
                    'Insta Wash Uganda is a registered and licensed professional general cleaning company specializing in several highly sensitive sanitation and maintenance services such as; mobile auto and fleet cleaning, office and commercial building cleaning, home care and residential cleaning, industrial, warehouse and factory cleaning, hospital & health facilities cleaning, road, railway and airfield cleaning, garbage collection and waste management, fumigation and pest control among others.',
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 15 : 17,
                      fontWeight: FontWeight.w400,
                      color: bodyColor,
                      height: 1.85,
                    ),
                  ),
                ).animate(delay: 100.ms).fadeIn(duration: 500.ms),
              ],
            ),
          ),

          // ===== MISSION, VISION, VALUES SECTION =====
          Container(
            width: double.infinity,
            color: cardBackground,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 48 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(
                  isMobile: isMobile,
                  title: 'OUR MISSION, VISION & VALUES',
                  titleColor: titleColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 36),
                _buildMVVCards(
                  isMobile,
                  titleColor,
                  bodyColor,
                  cardBackground,
                  accentColor,
                  borderColor,
                ),
              ],
            ),
          ),

          // ===== AIM SECTION =====
          Container(
            width: double.infinity,
            color: sectionBackground,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 48 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(
                  isMobile: isMobile,
                  title: 'OUR AIM',
                  titleColor: titleColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildAimPoint(isMobile, bodyColor, '🎯', 'OUR AIM',
                          'As a professional brand offering home care, mobile auto and general commercial cleaning services, we aim at going above and beyond the customers\' expectations by providing professional & premium quality cleaning services through our expertise, experience modern technology in our bid to achieve excellent results.'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ===== COMPANY BACKGROUND SECTION =====
          Container(
            width: double.infinity,
            color: cardBackground,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 48 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(
                  isMobile: isMobile,
                  title: 'OUR STORY',
                  titleColor: titleColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildBackgroundParagraph(
                        isMobile,
                        bodyColor,
                        'With over five years of experience in vehicle and residential cleaning services, we have realized that there is a never-ending need for professional, convenient, reliable and trusted cleaning and garbage collection services across all sectors. It is therefore against this background that the proprietors of Insta Wash Uganda created a practical modern-day approach to have the services brought to the client at any given location. With our mobile auto and fleet cleaning water tank trucks, we have more than enough capacity to provide cleaning services to our clients at their residence, work place or at any given location with cleaning needs. Our mobile and general commercial cleaning services are made possible with recent innovations in digital communication and automated technologies which are regularly upgraded to meet the ever-growing cleaning and garbage collection needs in the market.',
                      ),
                      const SizedBox(height: 20),
                      _buildBackgroundParagraph(
                        isMobile,
                        bodyColor,
                        'Because of the change in life style due to the pandemic most people are very critical about anything that consumes their time, energy and resources and therefore prefer to have cleaning services brought to them than reaching out for them. This is why Insta Wash Uganda is here to provide a one-stop solution to all our clientele. One call to us cleans it all. We have enriched our services by the creation of an APP called INSTAWASH APP to ease access to our services, we also have a well-trained and experienced workforce of over 100 employees recruited from all over the country. Alongside all that we have the latest technologies and modern cleaning equipment that instills confidence in us to serve our clients effectively & to their desired level of satisfaction',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ===== CORE VALUES SECTION =====
          Container(
            width: double.infinity,
            color: sectionBackground,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 48 : 64,
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
                const SizedBox(height: 36),
                _buildCoreValuesGrid(isMobile, titleColor, bodyColor, cardBackground, borderColor, accentColor),
              ],
            ),
          ),

          // ===== OBJECTIVES SECTION =====
          Container(
            width: double.infinity,
            color: cardBackground,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 48 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(
                  isMobile: isMobile,
                  title: 'OUR OBJECTIVES',
                  titleColor: titleColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 24),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildObjectivePoint(isMobile, bodyColor, '✓', 'To deliver an exceptional customer care service experience through the provision of instant, proficient, convenient and premium quality garbage collection, commercial cleaning, mobile auto & fleet cleaning services.'),
                      _buildObjectivePoint(isMobile, bodyColor, '✓', 'To help clients save time & money through a customized mobile approach of bringing professional cleaning services to our clients\' location other than them reaching out for the same.'),
                      _buildObjectivePoint(isMobile, bodyColor, '✓', 'To provide the best alternative to the traditional use of bare hands during auto care and fleet cleaning, with efficient and effective modern-day technological capabilities.'),
                      _buildObjectivePoint(isMobile, bodyColor, '✓', 'To provide an all-round one stop solution for instant mobile cleaning services such as car wash, laundry, office and commercial cleaning to clients in a bid to maintain and preserve the beauty, quality & appearance of their cars, office space, workplaces, residences and laundry.'),
                      _buildObjectivePoint(isMobile, bodyColor, '✓', 'To extend our professional cleaning services to all corners of the country, giving priority to key towns and cities.'),
                      _buildObjectivePoint(isMobile, bodyColor, '✓', 'To utilize 50% of the profit outcome in establishing free ambulance and rescue services (CSR) as this is the conviction of the proprietors. This service will hugely benefit all road users during times of emergencies.'),
                      _buildObjectivePoint(isMobile, bodyColor, '✓', 'To provide the best garbage collection and disposal service approach to our clientele through our well thought out operational model from collection to disposal and later recycling.'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // ===== STATS SECTION =====
          Container(
            width: double.infinity,
            color: cardBackground,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 48 : 64,
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
                const SizedBox(height: 36),
                _buildStatsGrid(isMobile, titleColor, bodyColor, accentColor),
              ],
            ),
          ),

          // ===== WHY CHOOSE US SECTION =====
          Container(
            width: double.infinity,
            color: sectionBackground,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 48 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SectionTitle(
                  isMobile: isMobile,
                  title: 'WHY CHOOSE INSTA WASH',
                  titleColor: titleColor,
                  accentColor: accentColor,
                ),
                const SizedBox(height: 36),
                _buildWhyChooseGrid(isMobile, titleColor, bodyColor, cardBackground, borderColor, accentColor),
              ],
            ),
          ),

          // ===== CTA SECTION =====
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 40,
              vertical: isMobile ? 48 : 64,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ready to Experience Premium Cleaning?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 28 : 38,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    height: 1.3,
                  ),
                ).animate().fadeIn(duration: 500.ms),
                const SizedBox(height: 16),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: Text(
                    'Get started today and join thousands of satisfied customers across Uganda',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 15 : 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.9),
                    ),
                  ),
                ).animate(delay: 100.ms).fadeIn(duration: 500.ms),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => context.go('/contact'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Get in Touch',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () => context.go('/services'),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.white, width: 2),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'View Services',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ).animate(delay: 200.ms).fadeIn(duration: 500.ms),
              ],
            ),
          ),

          const AppFooter(),
        ],
      ),
    );
  }

  Widget _buildMVVCards(
    bool isMobile,
    Color titleColor,
    Color bodyColor,
    Color cardBackground,
    Color accentColor,
    Color borderColor,
  ) {
    final cards = [
      {
        'icon': '🎯',
        'title': 'OUR VISION',
        'content': 'To be a market leader with the most noticeable and exceptional general cleaning/ garbage collection service in the whole country.',
      },
      {
        'icon': '🚀',
        'title': 'OUR MISSION',
        'content': 'To consistently meet the growing demand for cleaning services through provision of the most convenient, proficient and top-quality domestic, industrial and general commercial cleaning services required by our clientele across the board',
      },
      {
        'icon': '✨',
        'title': 'OUR PURPOSE',
        'content': 'Our ultimate purpose is to extend the most reliable, proficient and strategic cleaning services to all domestic, commercial, government and private clientele while ensuring value for money and sustainable maintenance for their investments. This can be achieved through the wide range of professional cleaning services provided by Insta Wash Uganda the only one-stop mobile auto and commercial cleaning company in the whole country. We therefore aim at going above and beyond the clients\' expectations by providing professional & premium quality cleaning services in our bid to attain undisputed customer satisfaction.',
      },
    ];

    return Column(
      spacing: 24,
      children: cards.map((card) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: cardBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                card['icon']!,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 16),
              Text(
                card['title']!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: accentColor,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 3,
                width: 40,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                card['content']!,
                textAlign: TextAlign.justify,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: bodyColor,
                  height: 1.8,
                ),
              ),
            ],
          ),
        ).animate(delay: 100.ms).fadeIn(duration: 500.ms);
      }).toList(),
    );
  }

  Widget _buildAimPoint(
    bool isMobile,
    Color bodyColor,
    String emoji,
    String title,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 16 : 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 14 : 15,
                    fontWeight: FontWeight.w400,
                    color: bodyColor,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(
    bool isMobile,
    Color titleColor,
    Color bodyColor,
    Color accentColor,
  ) {
    final stats = [
      {'number': '7+', 'label': 'Years in Business', 'description': 'Serving Uganda since 2020'},
      {'number': '500+', 'label': 'Happy Clients', 'description': 'Homes and businesses served'},
      {'number': '1000+', 'label': 'Jobs Completed', 'description': 'Professional service delivered'},
      {'number': '100%', 'label': 'Customer Satisfaction', 'description': 'Quality you can trust'},
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: stats.map((stat) {
        return SizedBox(
          width: isMobile ? double.infinity : 200,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  stat['number']!,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 40 : 48,
                    fontWeight: FontWeight.w800,
                    color: accentColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  stat['label']!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  stat['description']!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: bodyColor,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildWhyChooseGrid(
    bool isMobile,
    Color titleColor,
    Color bodyColor,
    Color cardBackground,
    Color borderColor,
    Color accentColor,
  ) {
    final features = [
      {
        'icon': '⚡',
        'title': 'Fast Response',
        'description': 'Quick online booking and same-day service availability',
      },
      {
        'icon': '🌱',
        'title': 'Eco-Friendly',
        'description': 'Sustainable products and responsible waste disposal',
      },
      {
        'icon': '👥',
        'title': 'Expert Teams',
        'description': 'Trained professionals dedicated to excellence',
      },
      {
        'icon': '💰',
        'title': 'Transparent Pricing',
        'description': 'Clear quotes with no hidden charges',
      },
      {
        'icon': '📱',
        'title': 'Real-Time Updates',
        'description': 'Track your service with live notifications',
      },
      {
        'icon': '🎯',
        'title': 'Custom Solutions',
        'description': 'Services tailored to your specific needs',
      },
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: features.map((feature) {
        return SizedBox(
          width: isMobile ? double.infinity : 280,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feature['icon']!,
                  style: const TextStyle(fontSize: 36),
                ),
                const SizedBox(height: 12),
                Text(
                  feature['title']!,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  feature['description']!,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: bodyColor,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBackgroundParagraph(
    bool isMobile,
    Color bodyColor,
    String text,
  ) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: GoogleFonts.poppins(
        fontSize: isMobile ? 14 : 15,
        fontWeight: FontWeight.w400,
        color: bodyColor,
        height: 1.85,
      ),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildCoreValuesGrid(
    bool isMobile,
    Color titleColor,
    Color bodyColor,
    Color cardBackground,
    Color borderColor,
    Color accentColor,
  ) {
    final values = [
      {
        'icon': '💼',
        'title': 'Professionalism',
        'content': 'We are a team that works with exceptional dedication, pride and passion for what we do. We are the ultimate solution to all your cleaning needs.',
      },
      {
        'icon': '😊',
        'title': 'Customer Satisfaction',
        'content': 'We strive for long-lasting relations/partnerships by ensuring the highest possible standard of excellence and convenience to our clientele.',
      },
      {
        'icon': '⏱️',
        'title': 'Time and Convenience',
        'content': 'We recognize that time is essential to our clientele. This is why we have decided to reverse the norm by bringing the service to the client, instead of the client seeking out for the service.',
      },
    ];

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: values.map((value) {
        return SizedBox(
          width: isMobile ? double.infinity : 280,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: cardBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value['icon']!,
                  style: const TextStyle(fontSize: 36),
                ),
                const SizedBox(height: 12),
                Text(
                  value['title']!,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  value['content']!,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: bodyColor,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ).animate(delay: 100.ms).fadeIn(duration: 500.ms),
        );
      }).toList(),
    );
  }

  Widget _buildObjectivePoint(
    bool isMobile,
    Color bodyColor,
    String icon,
    String description,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              icon,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 14 : 15,
                fontWeight: FontWeight.w400,
                color: bodyColor,
                height: 1.7,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: accentColor,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 2,
          width: 50,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
  }
}
