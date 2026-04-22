import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intawashuganda/core/constants/app_constants.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _messageController;
  GoogleMapController? _mapController;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _launchMailClient() async {
    final subject = Uri.encodeComponent('Contact from ${_nameController.text.trim()}');
    final body = Uri.encodeComponent(
      'Name: ${_nameController.text.trim()}\n'
      'Email: ${_emailController.text.trim()}\n'
      'Phone: ${_phoneController.text.trim()}\n\n'
      '${_messageController.text.trim()}',
    );
    final mailtoUri = Uri.parse('mailto:${AppConstants.email}?subject=$subject&body=$body');
    if (await canLaunchUrl(mailtoUri)) {
      await launchUrl(mailtoUri);
    }
  }

  Future<bool> _sendViaFormSubmit() async {
    final uri = Uri.parse('https://formsubmit.co/${AppConstants.email}');
    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
        'message': _messageController.text.trim(),
        '_subject': '🚨 Insta Wash: New Client Inquiry from ${_nameController.text.trim()}',
        '_replyto': _emailController.text.trim(),
        '_captcha': 'false',
      },
      encoding: utf8,
    );
    return response.statusCode >= 200 && response.statusCode < 400;
  }

  Future<void> _submitContactForm() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);

    try {
      final success = await _sendViaFormSubmit();
      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Message sent successfully. Thank you!',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: AppColors.secondary,
              behavior: SnackBarBehavior.floating,
            ),
          );
          _nameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _messageController.clear();
        }
      } else {
        await _launchMailClient();
      }
    } catch (_) {
      await _launchMailClient();
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
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
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDarkMode
                      ? [
                          const Color(0xFF1A2332),
                          const Color(0xFF252E3D),
                        ]
                      : [
                          AppColors.primary.withOpacity(0.1),
                          AppColors.secondary.withOpacity(0.05),
                        ],
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get in Touch',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 32 : 44,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Have a question? We\'d love to hear from you. Send us a message and we\'ll respond as soon as possible.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? const Color(0xFFB0BAC9) : AppColors.mediumGrey,
                      height: 1.6,
                    ),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            // Main Content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                children: [
                  if (!isMobile)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: _buildContactInfo(),
                        ),
                        const SizedBox(width: 60),
                        Expanded(
                          flex: 1,
                          child: _buildContactForm(),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        _buildContactInfo(),
                        const SizedBox(height: 60),
                        _buildContactForm(),
                      ],
                    ),
                  const SizedBox(height: 80),
                  // Map Section
                  _buildMapSection(isMobile),
                  
                  // Footer
                  const AppFooter(),
                ],
              ),
            ),
          ],
        ),
    );
  }

  Widget _buildContactInfo() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
          ),
        ),
        const SizedBox(height: 32),
        _ContactInfoCard(
          icon: FontAwesomeIcons.mapPin,
          title: 'Address',
          content: AppConstants.address,
          color: const Color(0xFFFF6B6B),
        ),
        const SizedBox(height: 20),
        _ContactInfoCard(
          icon: FontAwesomeIcons.phone,
          title: 'Phone',
          content: AppConstants.phone,
          color: const Color(0xFF4ECDC4),
          isClickable: true,
        ),
        const SizedBox(height: 20),
        _ContactInfoCard(
          icon: FontAwesomeIcons.envelope,
          title: 'Email',
          content: AppConstants.email,
          color: const Color(0xFFFFE66D),
          isClickable: true,
        ),
        const SizedBox(height: 32),
        Text(
          'Follow Us',
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _SocialIconButton(
              icon: FontAwesomeIcons.facebook,
              color: const Color(0xFF1877F2),
              url: 'https://www.facebook.com/share/1CtFJPp7S7/',
            ),
            const SizedBox(width: 16),
            _SocialIconButton(
              icon: FontAwesomeIcons.instagram,
              color: const Color(0xFFE4405F),
              url: 'https://www.instagram.com/instawash_uganda?utm_source=qr&igsh=bTdobWVsOWtxa241',
            ),
            const SizedBox(width: 16),
            _SocialIconButton(
              icon: FontAwesomeIcons.tiktok,
              color: const Color(0xFF000000),
              url: 'https://www.tiktok.com/@insta.wash.uganda?_r=1&_t=ZS-95ar3Wf2cJU',
            ),
            const SizedBox(width: 16),
            _SocialIconButton(
              icon: FontAwesomeIcons.whatsapp,
              color: const Color(0xFF25D366),
              url: 'https://wa.me/qr/QYARTG3JEE66P1',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactForm() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send us a Message',
            style: GoogleFonts.poppins(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 32),
          _buildFormField(
            controller: _nameController,
            label: 'Your Name',
            hint: 'John Kabira',
            icon: FontAwesomeIcons.user,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _buildFormField(
            controller: _emailController,
            label: 'Email Address',
            hint: 'john@example.com',
            icon: FontAwesomeIcons.envelope,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _buildFormField(
            controller: _phoneController,
            label: 'Phone Number',
            hint: '+256 700 123456',
            icon: FontAwesomeIcons.phone,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your phone number';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _buildFormField(
            controller: _messageController,
            label: 'Message',
            hint: 'Tell us how we can help...',
            icon: FontAwesomeIcons.message,
            maxLines: 5,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _isSubmitting ? null : _submitContactForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isSubmitting
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.white,
                        ),
                        strokeWidth: 2.5,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.paperPlane,
                          color: AppColors.white,
                          size: 18,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Send Message',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?) validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 16, right: 12),
          child: FaIcon(icon, size: 18, color: AppColors.primary),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        filled: true,
        fillColor: AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.borderGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        alignLabelWithHint: maxLines > 1,
      ),
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      validator: validator,
    );
  }

  Widget _buildMapSection(bool isMobile) {
    final lat = 0.3550620863638853;
    final lng = 32.59845464953972;
    final mapsUrl = 'https://maps.google.com/?q=$lat,$lng';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Find Us on the Map',
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.darkGrey,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          width: double.infinity,
          height: isMobile ? 400 : 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.borderGrey),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: GoogleMap(
              onMapCreated: (controller) {
                _mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: LatLng(lat, lng),
                zoom: 15,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId('location'),
                  position: LatLng(lat, lng),
                  infoWindow: InfoWindow(
                    title: AppConstants.appName,
                    snippet: AppConstants.address,
                  ),
                ),
              },
              zoomControlsEnabled: true,
              compassEnabled: true,
              myLocationButtonEnabled: false,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton.icon(
            onPressed: () async {
              if (await canLaunchUrl(Uri.parse(mapsUrl))) {
                await launchUrl(
                  Uri.parse(mapsUrl),
                  mode: LaunchMode.externalApplication,
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const FaIcon(
              FontAwesomeIcons.directions,
              size: 18,
              color: AppColors.white,
            ),
            label: Text(
              'Get Directions',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.borderGrey),
          ),
          child: Row(
            children: [
              FaIcon(
                FontAwesomeIcons.info,
                size: 18,
                color: AppColors.primary,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Coordinates: ${lat.toStringAsFixed(4)}, ${lng.toStringAsFixed(4)}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.mediumGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactInfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;
  final Color color;
  final bool isClickable;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.content,
    required this.color,
    this.isClickable = false,
  });

  @override
  State<_ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<_ContactInfoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final cardBg = isDarkMode ? const Color(0xFF1A2332) : AppColors.white;
    final borderColor = isDarkMode ? const Color(0xFF3A4555) : AppColors.borderGrey;
    final labelColor = isDarkMode ? const Color(0xFFB0BAC9) : AppColors.mediumGrey;
    final textColor = isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: widget.isClickable ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? widget.color : borderColor,
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withOpacity(0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(isDarkMode ? 0.2 : 0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: widget.color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: FaIcon(
                  widget.icon,
                  color: widget.color,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: labelColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.content,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  final IconData icon;
  final Color color;
  final String url;

  const _SocialIconButton({
    required this.icon,
    required this.color,
    required this.url,
  });

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.url))) {
            await launchUrl(
              Uri.parse(widget.url),
              mode: LaunchMode.externalApplication,
            );
          }
        },
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
                      color: widget.color.withOpacity(0.3),
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
