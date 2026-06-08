import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intawashuganda/core/constants/app_constants.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _companyController;
  late TextEditingController _messageController;

  String? _selectedService;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _companyController = TextEditingController();
    _messageController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<bool> _sendViaFormSubmit() async {
    final uri = Uri.parse('https://formsubmit.co/iakena420@gmail.com');
    final response = await http.post(
      uri,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'phone': _phoneController.text.trim(),
        'company': _companyController.text.trim(),
        'service': _selectedService ?? 'Not selected',
        'message': _messageController.text.trim(),
        '_subject': '💼 Quote Request from ${_nameController.text.trim()}',
        '_replyto': _emailController.text.trim(),
        '_captcha': 'false',
      },
      encoding: utf8,
    );
    return response.statusCode >= 200 && response.statusCode < 400;
  }

  Future<void> _submitQuoteForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    try {
      final success = await _sendViaFormSubmit();
      if (success) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Quote request sent! We\'ll contact you shortly.',
                style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
              ),
              backgroundColor: AppColors.info,
              behavior: SnackBarBehavior.floating,
            ),
          );
          _nameController.clear();
          _emailController.clear();
          _phoneController.clear();
          _companyController.clear();
          _messageController.clear();
          _selectedService = null;
        }
      } else {
        _showErrorMessage('Failed to send request. Please try again.');
      }
    } catch (e) {
      _showErrorMessage('Error: ${e.toString()}');
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: GoogleFonts.poppins()),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return FixedHeaderLayout(
      backgroundColor: isDarkMode ? const Color(0xFF0F1419) : AppColors.white,
      child: SingleChildScrollView(
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
                          AppColors.info.withOpacity(0.05),
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
                    'Get a Free Quote',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 32 : 44,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode
                          ? const Color(0xFFE8EDF7)
                          : AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Tell us about your cleaning needs and we\'ll provide a custom quote tailored to your requirements.',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode
                          ? const Color(0xFFB0BAC9)
                          : AppColors.mediumGrey,
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
                  // Service Selection
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Your Service',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode
                              ? const Color(0xFFE8EDF7)
                              : AppColors.darkGrey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Choose the service category that best matches your needs',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: isDarkMode
                              ? const Color(0xFFB0BAC9)
                              : AppColors.mediumGrey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        initialValue: _selectedService,
                        decoration: InputDecoration(
                          labelText: 'Service Category',
                          hintText: 'Select a service',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 16, right: 12),
                            child: FaIcon(
                              FontAwesomeIcons.clipboardList,
                              size: 18,
                              color: AppColors.primary,
                            ),
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(minWidth: 0, minHeight: 0),
                          filled: true,
                          fillColor: isDarkMode
                              ? const Color(0xFF1A2332)
                              : AppColors.lightGrey,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: isDarkMode
                                  ? const Color(0xFF2A3A4D)
                                  : AppColors.borderGrey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 2,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                        items: AppConstants.serviceCategories
                            .map((service) => DropdownMenuItem(
                                  value: service,
                                  child: Text(
                                    service,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: isDarkMode
                                          ? const Color(0xFFE8EDF7)
                                          : AppColors.darkGrey,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() => _selectedService = value);
                        },
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? const Color(0xFFE8EDF7)
                              : AppColors.darkGrey,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select a service';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 60),
                    ],
                  ),
                  // Quote Form
                  if (!isMobile)
                    _buildQuoteForm(isDarkMode)
                  else
                    _buildQuoteForm(isDarkMode),
                  const SizedBox(height: 80),
                  const AppFooter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuoteForm(bool isDarkMode) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Information',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: isDarkMode
                  ? const Color(0xFFE8EDF7)
                  : AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Help us understand your requirements better',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: isDarkMode
                  ? const Color(0xFFB0BAC9)
                  : AppColors.mediumGrey,
            ),
          ),
          const SizedBox(height: 32),
          _buildFormField(
            controller: _nameController,
            label: 'Full Name',
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
              if (!value!.contains('@')) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _buildFormField(
            controller: _phoneController,
            label: 'Phone Number',
            hint: '+256 741 074382',
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
            controller: _companyController,
            label: 'Company/Organization (Optional)',
            hint: 'Your company name',
            icon: FontAwesomeIcons.building,
          ),
          const SizedBox(height: 20),
          _buildFormField(
            controller: _messageController,
            label: 'Additional Details',
            hint: 'Tell us more about your cleaning needs...',
            icon: FontAwesomeIcons.message,
            maxLines: 5,
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please provide additional details';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _isSubmitting ? null : _submitQuoteForm,
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
                          'Request Quote',
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
    required FaIconData icon,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
        fillColor: isDarkMode ? const Color(0xFF1A2332) : AppColors.lightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDarkMode
                ? const Color(0xFF2A3A4D)
                : AppColors.borderGrey,
          ),
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
        color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
      ),
      validator: validator,
    );
  }
}
