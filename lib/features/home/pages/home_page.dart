
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intawashuganda/core/constants/app_constants.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/youtube_hero_section.dart';
import 'package:intawashuganda/shared/widgets/animated_stats_section.dart';
import 'package:intawashuganda/shared/widgets/testimonial_carousel.dart';
import 'package:intawashuganda/shared/widgets/featured_videos_section.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

Future<void> _openWhatsApp() async {
  final uri = Uri.parse(
    '${AppConstants.whatsappUrl}?text=${Uri.encodeComponent('Hello Insta Wash Uganda! I would like to book a service.')}',
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return FixedHeaderLayout(
      headerIsTransparent: true,
      backgroundColor: isDarkMode ? const Color(0xFF0F1419) : AppColors.white,
      child: Column(
        children: [
          Divider(height: 5, color: Colors.orangeAccent),
          // Local Video Hero Section with Muted Background
          const YouTubeHeroSection(
            fallbackImagePath: 'assets/services/office cleaning.jpg',
            isFullWidth: true,
          ),
          
          Divider(height: 5, color: Colors.orangeAccent),

            // Main Service Categories
            Container(
              width: double.infinity,
              color: isDarkMode ? const Color(0xFF1A2332) : AppColors.lightGrey,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 40 : 56,
              ),
              child: Column(
                children: [
                  Text(
                    'CHECK OUT OUR CORE SERVICES',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.2),
                  
                  const SizedBox(height: 32),
                  _ServicePhotoCarousel(isMobile: isMobile),
                ],
              ),
            ),

            // Animated Stats Section
            const AnimatedStatsSection(),

            // KCCA Partnership Section
            Container(
              width: double.infinity,
              color: isDarkMode ? const Color(0xFF0F1419) : AppColors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 40 : 60,
              ),
              child: Column(
                children: [
                  Text(
                    'KCCA AND INSTA WASH PARTNERSHIP FOR KAMPALA STREETS AND ROAD CLEANING PILOT PROJECT',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 36,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.2),
                  const SizedBox(height: 16),
                  Text(
                    'Transforming Kampala\'s urban spaces through professional cleaning services and community engagement initiatives',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? const Color(0xFFB0BED9) : AppColors.mediumGrey,
                      height: 1.6,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.2, delay: 100.ms),
                  const SizedBox(height: 40),
                  _KCCAImageCarousel(isMobile: isMobile, isDarkMode: isDarkMode),
                ],
              ),
            ),

            // Featured Videos Section
            FeaturedVideosSection(isMobile: isMobile),

            // Testimonials Carousel Section
            TestimonialCarousel(
              testimonials: [
                Testimonial(
                  name: 'Daniel Ssemanda',
                  role: 'Business Owner',
                  comment: 'Outstanding service! The team was professional, punctual, and thorough. My office has never looked cleaner. Highly recommended!',
                  rating: 5,
                ),
                Testimonial(
                  name: 'Okello James',
                  role: 'Homeowner',
                  comment: 'I was impressed by the attention to detail. Every corner was cleaned meticulously. Worth every shilling!',
                  rating: 5,
                ),
                Testimonial(
                  name: 'Brian Tumusiime Ainebyoona',
                  role: 'School Principal',
                  comment: 'Reliable and efficient team. They transformed our school facilities. Parents have noticed the difference!',
                  rating: 5,
                ),
                Testimonial(
                  name: 'Nabwire Wafula',
                  role: 'Restaurant Manager',
                  comment: 'Professional and consistent. Our customers appreciate the clean environment. They\'re our go-to cleaning service.',
                  rating: 5,
                ),
                Testimonial(
                  name: 'Sarah Namusoke Nakiwogo',
                  role: 'Tech Startup CEO',
                  comment: 'Finally found a cleaning service that understands the needs of a modern office. Excellent work!',
                  rating: 5,
                ),
                Testimonial(
                  name: 'Achen Florence',
                  role: 'Hotel Manager',
                  comment: 'Dependable service with amazing results. Our guests often compliment the cleanliness. Highly satisfied!',
                  rating: 5,
                ),
              ],
            ),

            // Trusted Clients Section
            Container(
              width: double.infinity,
              color: isDarkMode ? const Color(0xFF1A2332) : AppColors.lightGrey,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 40 : 56,
              ),
              child: Column(
                children: [
                  Text(
                    'OUR CURRENT AND PAST CLIENTS',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.2),
                  const SizedBox(height: 8),
                  Text(
                    'Partnering with renowned organizations across Uganda',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? const Color(0xFFB0BED9) : AppColors.mediumGrey,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.2, delay: 100.ms),
                  const SizedBox(height: 48),
                  Wrap(
                    spacing: isMobile ? 24 : 40,
                    runSpacing: isMobile ? 32 : 48,
                    alignment: WrapAlignment.center,
                    children: [
                      _ClientLogo(
                        imagePath: 'assets/clients/afm.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/kcca.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/fotogenix.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/assosiation.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/kesington.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/timea.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/obunji.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/scania.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/rochester.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/EP.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/uwa.png',
                        height: isMobile ? 100 : 140,
                      ),
                      _ClientLogo(
                        imagePath: 'assets/clients/endelea.png',
                        height: isMobile ? 100 : 140,
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .slideY(begin: 0.3, delay: 200.ms),
                ],
              ),
            ),

            // CTA Section
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 28,
                    offset: const Offset(0, 14),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 40,
                vertical: isMobile ? 48 : 64,
              ),
              child: Column(
                children: [
                  Text(
                    'Ready to Get Your Space Clean?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Book your service now and experience the difference with Insta Wash Uganda.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.92),
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _openWhatsApp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.info,
                      foregroundColor: AppColors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 44,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'Book Now',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
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

class _ServicePhotoCarousel extends StatefulWidget {
  final bool isMobile;

  const _ServicePhotoCarousel({required this.isMobile});

  @override
  State<_ServicePhotoCarousel> createState() => _ServicePhotoCarouselState();
}

class _ServicePhotoCarouselState extends State<_ServicePhotoCarousel> {
  final ScrollController _scrollController = ScrollController();
  int _activePage = 0;
  Timer? _autoScrollTimer;
  double _scrollOffset = 0.0;
  DateTime? _lastInteraction;

  static const _autoScrollInterval = Duration(milliseconds: 20);
  static const _autoScrollDelta = 2.0;
  static const _autoScrollPauseAfterInteraction = Duration(seconds: 3);

  final List<_ServiceCarouselItem> _items = const [
    _ServiceCarouselItem(
      title: 'RESIDENTIAL & HOME CARE SERVICES',
      description: 'Complete home care for kitchens, bedrooms, bathrooms and living areas.',
      imagePath: 'assets/services/home cleaning.jpg',
    ),
_ServiceCarouselItem(
  title: 'OFFICE CLEANING',
  description: 'Routine cleaning and maintenance for offices, including desks, floors, and shared work areas.',
  imagePath: 'assets/services/office cleaning.jpg',
),
_ServiceCarouselItem(
  title: 'COMMERCIAL CLEANING',
  description: 'Specialized cleaning for retail stores, malls, and high-traffic commercial spaces with customer-facing areas.',
  imagePath: 'assets/services/commercial.jpg',
),
    _ServiceCarouselItem(
      title: 'INDUSTRIAL CLEANING',
      description: 'Expert INDUSTRIAL and warehouse cleaning services.',
      imagePath: 'assets/services/warehouse.jpg',
    ),
    _ServiceCarouselItem(
      title: 'SPECIALIZED CLEANING',
      description: 'Expert care for roofs, pavers and hard-to-reach surfaces.',
      imagePath: 'assets/services/pavers cleaning.jpg',
    ),
    _ServiceCarouselItem(
      title: 'FUMIGATION & PEST CONTROL',
      description: 'Trusted pest removal for safer, cleaner homes and offices.',
      imagePath: 'assets/services/pest control.jpg',
    ),
    _ServiceCarouselItem(
      title: 'MOBILE AUTO & FLEET CLEANING',
      description: 'Exterior and interior detailing to keep your vehicle spotless.',
      imagePath: 'assets/services/car exterior cleaning.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _autoScrollTimer = Timer.periodic(_autoScrollInterval, (_) {
      if (!_scrollController.hasClients) return;
      if (_lastInteraction != null && DateTime.now().difference(_lastInteraction!) < _autoScrollPauseAfterInteraction) {
        return;
      }

      final position = _scrollController.position;
      if (!position.hasPixels) return;

      final maxScroll = position.maxScrollExtent;
      _scrollOffset += _autoScrollDelta;
      if (_scrollOffset > maxScroll) {
        _scrollOffset = 0.0;
      }

      _scrollController.jumpTo(_scrollOffset.clamp(0.0, maxScroll));

      final itemWidth = widget.isMobile ? MediaQuery.of(context).size.width * 0.84 : MediaQuery.of(context).size.width * 0.52;
      final newPage = (_scrollOffset / (itemWidth + 16)).round().clamp(0, _items.length - 1);
      if (newPage != _activePage) {
        setState(() => _activePage = newPage);
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _registerInteraction() {
    _lastInteraction = DateTime.now();
  }

  void _scrollToPage(int page) {
    final itemWidth = widget.isMobile ? MediaQuery.of(context).size.width * 0.84 : MediaQuery.of(context).size.width * 0.52;
    final offset = page * (itemWidth + 16);
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        offset.clamp(0.0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
      setState(() => _activePage = page);
      _registerInteraction();
    }
  }

  Future<void> _openWhatsApp() async {
    final uri = Uri.parse('${AppConstants.whatsappUrl}?text=${Uri.encodeComponent('Hello Insta Wash Uganda! I would like to book a service.') }');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardHeight = widget.isMobile ? 340.0 : 360.0;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final itemWidth = widget.isMobile ? MediaQuery.of(context).size.width * 0.80 : MediaQuery.of(context).size.width * 0.52;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: cardHeight,
              child: Listener(
                onPointerDown: (_) => _registerInteraction(),
                child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: _items.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        width: itemWidth,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(28),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                item.imagePath,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.64),
                                      Colors.black.withOpacity(0.24),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 24,
                                right: 24,
                                bottom: 24,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: GoogleFonts.poppins(
                                        fontSize: widget.isMobile ? 24 : 28,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      item.description,
                                      style: GoogleFonts.poppins(
                                        fontSize: widget.isMobile ? 14 : 15,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.white.withOpacity(0.92),
                                        height: 1.6,
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    ElevatedButton.icon(
                                      onPressed: _openWhatsApp,
                                      icon: const Icon(Icons.chat_rounded, size: 18),
                                      label: Text(
                                        'Book on WhatsApp',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.info,
                                        foregroundColor: AppColors.white,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 24,
                                          vertical: 14,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              left: 0,
              child: IconButton(
                onPressed: () {
                  final previousPage = _activePage > 0 ? _activePage - 1 : 0;
                  _scrollToPage(previousPage);
                },
                icon: Icon(Icons.chevron_left_rounded, size: 32, color: AppColors.white),
                splashRadius: 24,
                color: AppColors.white,
              ),
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {
                  final nextPage = _activePage < _items.length - 1 ? _activePage + 1 : _items.length - 1;
                  _scrollToPage(nextPage);
                },
                icon: Icon(Icons.chevron_right_rounded, size: 32, color: AppColors.white),
                splashRadius: 24,
                color: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_items.length, (index) {
            final isActive = _activePage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: isActive ? 22 : 10,
              height: 10,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.info
                    : AppColors.white.withOpacity(isDarkMode ? 0.7 : 0.35),
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _KCCAImageCarousel extends StatefulWidget {
  final bool isMobile;
  final bool isDarkMode;

  const _KCCAImageCarousel({
    required this.isMobile,
    required this.isDarkMode,
  });

  @override
  State<_KCCAImageCarousel> createState() => _KCCAImageCarouselState();
}

class _KCCAImageCarouselState extends State<_KCCAImageCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _autoScrollTimer;

  final List<String> _images = [
    'assets/KCCA/WhatsApp Image 2026-04-26 at 8.26.43 AM.jpeg',
    'assets/KCCA/WhatsApp Image 2026-04-26 at 8.26.45 AM (1).jpeg',
    'assets/KCCA/WhatsApp Image 2026-04-26 at 8.26.45 AM (2).jpeg',
    'assets/KCCA/WhatsApp Image 2026-04-26 at 8.26.45 AM (3).jpeg',
    'assets/KCCA/WhatsApp Image 2026-04-26 at 8.26.45 AM.jpeg',
    'assets/KCCA/WhatsApp Image 2026-04-26 at 8.26.46 AM (1).jpeg',
    'assets/KCCA/WhatsApp Image 2026-04-26 at 8.26.46 AM.jpeg',
    'assets/KCCA/WhatsApp Image 2026-04-26 at 8.26.47 AM (1).jpeg',
    'assets/KCCA/WhatsApp Image 2026-04-26 at 8.26.47 AM.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentPage + 1) % _images.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: widget.isMobile ? 320 : 450,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() => _currentPage = page);
              },
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                )
                    .animate()
                    .fadeIn(duration: 500.ms);
              },
            ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_images.length, (index) {
            final isActive = _currentPage == index;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              width: isActive ? 28 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.lightGrey,
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _ServiceCarouselItem {
  final String title;
  final String description;
  final String imagePath;

  const _ServiceCarouselItem({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

class _ClientLogo extends StatelessWidget {
  final String imagePath;
  final double height;

  const _ClientLogo({
    required this.imagePath,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Text(
              'Logo',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: AppColors.mediumGrey,
              ),
            ),
          );
        },
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms)
        .scale(begin: const Offset(0.9, 0.9));
  }
}
