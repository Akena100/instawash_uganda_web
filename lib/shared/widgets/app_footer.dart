import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDarkMode ? const Color(0xFF0F1419) : AppColors.darkGrey,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        children: [
          // Main Footer Content
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: isMobile ? 2 : 4,
            mainAxisSpacing: 40,
            crossAxisSpacing: 20,
            childAspectRatio: isMobile ? 1.2 : 1.5,
            children: [
              // Company Section
              _FooterSection(
                title: 'Company',
                items: [
                  _FooterLink(label: 'Home', route: '/'),
                  _FooterLink(label: 'About Us', route: '/about'),
                  _FooterLink(label: 'Team', route: '/team'),
                  _FooterLink(label: 'Projects', route: '/projects'),
                  _FooterLink(label: 'Contact', route: '/contact'),
                ],
              ),
              // Services Section
              _FooterSection(
                title: 'Services',
                items: [
                  _FooterLink(label: 'All Services', route: '/services'),
                
                  _FooterLink(label: 'Waste Management', route: '/waste'),
                  _FooterLink(label: 'Book Now', route: '/services'),
                ],
              ),
              // Support Section
              _FooterSection(
                title: 'Support',
                items: [
                  _FooterLink(label: 'Help & FAQ', route: '/faq'),
                  _FooterLink(label: 'Contact Support', route: '/contact'),
                  _FooterLink(label: 'Privacy Policy', route: '/privacy'),
                  _FooterLink(label: 'Terms & Conditions', route: '/terms'),
                ],
              ),
              // Contact Section
              _FooterSection(
                title: 'Connect',
                items: [
                  _FooterContactInfo(
                    icon: FontAwesomeIcons.phone,
                    label: '+256 393 242 629',
                    url: 'tel:+256393242629',
                  ),
                  _FooterContactInfo(
                    icon: FontAwesomeIcons.envelope,
                    label: 'instawashuganda@gmail.com',
                    url: 'mailto:instawashuganda@gmail.com',
                  ),
                  _FooterContactInfo(
                    icon: FontAwesomeIcons.whatsapp,
                    label: 'WhatsApp Chat',
                    url: 'https://wa.me/qr/QYARTG3JEE66P1',
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 60),

          // Divider
          Container(
            height: 1,
            color: Colors.white.withAlpha(26),
          ),

          const SizedBox(height: 40),

          // Bottom Footer
          isMobile
              ? Column(
                  children: [
                    Text(
                      '© 2024 Insta Wash Uganda. All rights reserved.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withAlpha(200),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _SocialIcon(
                          icon: FontAwesomeIcons.facebook,
                          url: 'https://www.facebook.com/share/1CtFJPp7S7/',
                          color: const Color(0xFF4267B2),
                        ),
                        const SizedBox(width: 16),
                        _SocialIcon(
                          icon: FontAwesomeIcons.instagram,
                          url: 'https://www.instagram.com/instawash_uganda?utm_source=qr&igsh=bTdobWVsOWtxa241',
                          color: const Color(0xFFE1306C),
                        ),
                        const SizedBox(width: 16),
                        _SocialIcon(
                          icon: FontAwesomeIcons.tiktok,
                          url: 'https://www.tiktok.com/@insta.wash.uganda?_r=1&_t=ZS-95ar3Wf2cJU',
                          color: Colors.black,
                        ),
                      
                         const SizedBox(width: 12),
                        _SocialIcon(
                          icon: FontAwesomeIcons.linkedin,
                          url: 'https://www.linkedin.com/in/insta-wash-uganda-087b47317/',
                          color: const Color.fromARGB(255, 35, 108, 203),
                        ),
                        const SizedBox(width: 12),
                        _SocialIcon(
                          icon: FontAwesomeIcons.xTwitter,
                          url: 'https://x.com/InstaWashUg',
                          color: Colors.black,
                        ),
                        SizedBox(width: 30,),
                        
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '© 2024 Insta Wash Uganda. All rights reserved.',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withAlpha(200),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _SocialIcon(
                          icon: FontAwesomeIcons.facebook,
                          url: 'https://www.facebook.com/share/1CtFJPp7S7/',
                          color: const Color(0xFF4267B2),
                        ),
                        const SizedBox(width: 12),
                        _SocialIcon(
                          icon: FontAwesomeIcons.instagram,
                          url: 'https://www.instagram.com/instawash_uganda?utm_source=qr&igsh=bTdobWVsOWtxa241',
                          color: const Color(0xFFE1306C),
                        ),
                        const SizedBox(width: 12),
                        _SocialIcon(
                          icon: FontAwesomeIcons.tiktok,
                          url: 'https://www.tiktok.com/@insta.wash.uganda?_r=1&_t=ZS-95ar3Wf2cJU',
                          color: Colors.black,
                        ),
                       
                        const SizedBox(width: 12),
                        _SocialIcon(
                          icon: FontAwesomeIcons.linkedin,
                          url: 'https://www.linkedin.com/in/insta-wash-uganda-087b47317/',
                          color: const Color.fromARGB(255, 35, 108, 203),
                        ),
                        const SizedBox(width: 12),
                        _SocialIcon(
                          icon: FontAwesomeIcons.xTwitter,
                          url: 'https://x.com/InstaWashUg',
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(width: 20,),
                  ],
                ),
        ],
      ),
    );
  }
}

class _FooterSection extends StatelessWidget {
  final String title;
  final List<dynamic> items;

  const _FooterSection({
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: AppColors.white,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 10),
        ...items.asMap().entries.map((entry) {
          dynamic item = entry.value;

          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: item,
          );
        }),
      ],
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final String route;

  const _FooterLink({
    required this.label,
    required this.route,
  });

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: _isHovered
                ? AppColors.info
                : Colors.white.withAlpha(220),
          ),
          curve: Curves.easeInOut,
          child: Text(widget.label),
        ),
      ),
    );
  }
}

class _FooterContactInfo extends StatelessWidget {
  final FaIconData icon;
  final String label;
  final String? url;

  const _FooterContactInfo({
    required this.icon,
    required this.label,
    this.url,
  });

  Future<void> _handleTap(BuildContext context) async {
    if (url == null) return;
    final uri = Uri.parse(url!);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not open $url')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            size: 18,
            color: AppColors.info,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white.withAlpha(230),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final FaIconData icon;
  final String url;
  final Color color;

  const _SocialIcon({
    required this.icon,
    required this.url,
    required this.color,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _isHovered = false;

  void _launchURL(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _launchURL(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: _isHovered ? widget.color : AppColors.lightGrey,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? widget.color : AppColors.borderGrey,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.color.withAlpha(77),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: FaIcon(
              widget.icon,
              color: _isHovered ? AppColors.white : widget.color,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }
}
