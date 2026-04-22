import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/constants/app_constants.dart';
import 'package:intawashuganda/core/providers/providers.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/service_card.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class ServicesPage extends ConsumerWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(serviceFilterProvider);
    final filteredServices = ref.watch(filteredServicesProvider);
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return FixedHeaderLayout(
      backgroundColor: isDarkMode ? const Color(0xFF0F1419) : AppColors.white,
      child: Column(
        children: [
          // Hero Section
          Container(
            width: double.infinity,
            color: isDarkMode ? const Color(0xFF1A2332) : AppColors.lightGrey,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'All Services',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 32 : 44,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose from our comprehensive range of professional cleaning services',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: isDarkMode ? const Color(0xFFB0BAC9) : AppColors.mediumGrey,
                    ),
                  ),
                ],
              ),
            ),
            // Category Filter
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter by Category',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _CategoryChip(
                        label: 'All',
                        isSelected: selectedCategory == null,
                        onTap: () =>
                            ref.read(serviceFilterProvider.notifier).state =
                                null,
                      ),
                      ...AppConstants.serviceCategories.map((category) {
                        return _CategoryChip(
                          label: category,
                          isSelected: selectedCategory == category,
                          onTap: () =>
                              ref.read(serviceFilterProvider.notifier).state =
                                  category,
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ),
            // Services Grid
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${filteredServices.length} Services Found',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mediumGrey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount:
                        isMobile ? 1 : (MediaQuery.of(context).size.width >
                                1200 ? 4 : 3),
                    mainAxisSpacing: isMobile ? 12 : 24,
                    crossAxisSpacing: isMobile ? 16 : 24,
                    children: filteredServices.map((service) {
                      return ServiceCard(
                        service: service,
                        onTap: () => context.go('/service/${service.id}'),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
            // Category Details Sections
            ..._buildCategoryDetails(context, isMobile),
            // Footer
            const AppFooter(),
          ],
        ),
    );
  }

  List<Widget> _buildCategoryDetails(BuildContext context, bool isMobile) {
    return [
      _CategoryDetailSection(
        title: 'Residential Cleaning',
        description:
            'Complete home cleaning solutions from basic maintenance to deep cleaning',
        services: [
          'Home Cleaning - Deep clean your entire home',
          'Gardening Services - Professional garden maintenance',
          'Water Tank Cleaning - Safe sanitization and filtration',
        ],
        isMobile: isMobile,
      ),
      _CategoryDetailSection(
        title: 'Commercial Services',
        description: 'Professional cleaning for offices, hospitals, schools, and malls',
        services: [
          'Office Cleaning - Daily office maintenance or one-time deep clean',
          'Hospital Cleaning - Sterilized and certified cleaning',
          'School Cleaning - Safe chemicals suitable for schools',
        ],
        isMobile: isMobile,
      ),
      _CategoryDetailSection(
        title: 'Auto Services',
        description: 'Complete vehicle care from interior to exterior detailing',
        services: [
          'Interior Cleaning - Deep clean carpets, seats, and dashboard',
          'Exterior Wash - Hand wash with premium wax coating',
          'Engine Wash - Professional engine detailing',
        ],
        isMobile: isMobile,
      ),
      _CategoryDetailSection(
        title: 'Specialized Services',
        description: 'Specialized cleaning for unique needs',
        services: [
          'Pest Control - Safe and effective fumigation',
          'Waste Management - Eco-friendly disposal',
          'Industrial Cleaning - For warehouses and factories',
        ],
        isMobile: isMobile,
      ),
    ];
  }
}

class _CategoryChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_CategoryChip> createState() => __CategoryChipState();
}

class __CategoryChipState extends State<_CategoryChip> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isSelected ? AppColors.primary : AppColors.lightGrey,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.isSelected
                  ? AppColors.primary
                  : (_isHovered
                      ? AppColors.borderGrey
                      : Colors.transparent),
              width: 1,
            ),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: widget.isSelected ? AppColors.white : AppColors.darkGrey,
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryDetailSection extends StatelessWidget {
  final String title;
  final String description;
  final List<String> services;
  final bool isMobile;

  const _CategoryDetailSection({
    required this.title,
    required this.description,
    required this.services,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            title,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 24 : 32,
              fontWeight: FontWeight.w700,
              color: AppColors.darkGrey,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.mediumGrey,
            ),
          ),
          const SizedBox(height: 24),
          ...services
              .map(
                (service) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          service,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
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
        ],
      ),
    );
  }
}
