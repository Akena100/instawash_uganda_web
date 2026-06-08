import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/models/project_model.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  late String _selectedCategory;
  late List<Project> _projects;

  @override
  void initState() {
    super.initState();
    _projects = _getProjects();
    _selectedCategory = 'All';
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isTablet =
        MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width < 1200;

    final categories = ['All', 'RESIDENTIAL', 'COMMERCIAL', 'INDUSTRIAL', 'Special'];
    final filteredProjects = _selectedCategory == 'All'
        ? _projects
        : _projects.where((p) => p.category == _selectedCategory).toList();

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return FixedHeaderLayout(
      backgroundColor: isDarkMode ? const Color(0xFF0F1419) : AppColors.white,
      child: Column(
        children: [

            // Hero Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 80,
              ),
              child: Column(
                children: [
                  Text(
                    'Our Projects',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 32 : 48,
                      fontWeight: FontWeight.w800,
                      color: AppColors.white,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.2),
                  const SizedBox(height: 16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Text(
                      'Explore our portfolio of successful projects completed for satisfied clients across Uganda',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 14 : 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white.withOpacity(0.9),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .slideY(begin: 0.1),
                ],
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                children: [
                  // Category Filter
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        categories.length,
                        (index) {
                          final category = categories[index];
                          final isSelected = _selectedCategory == category;

                          return Padding(
                            padding: EdgeInsets.only(right: index < categories.length - 1 ? 12 : 0),
                            child: GestureDetector(
                              onTap: () => setState(() => _selectedCategory = category),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  gradient: isSelected ? AppColors.primaryGradient : null,
                                  color: isSelected ? null : AppColors.lightGrey,
                                  borderRadius: BorderRadius.circular(12),
                                  border: isSelected
                                      ? null
                                      : Border.all(
                                          color: AppColors.lightGrey,
                                          width: 1,
                                        ),
                                ),
                                child: Text(
                                  category,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: isSelected ? AppColors.white : AppColors.darkGrey,
                                  ),
                                ),
                              ),
                            )
                                .animate()
                                .fadeIn(duration: 400.ms)
                                .slideX(begin: 0.1),
                          );
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Projects Grid
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
                      mainAxisSpacing: 32,
                      crossAxisSpacing: 32,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: filteredProjects.length,
                    itemBuilder: (context, index) {
                      return _ProjectCard(
                        project: filteredProjects[index],
                        delay: index * 100,
                      );
                    },
                  ),
                ],
              ),
            ),

            // Stats Section
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary.withOpacity(0.1), AppColors.info.withOpacity(0.1)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.primary.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Projects by the Numbers',
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 40),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: isMobile ? 2 : 4,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 24,
                    children: [
                      _StatCard(
                        number: '${_projects.length}+',
                        label: 'Projects Completed',
                      ),
                      _StatCard(
                        number: '98%',
                        label: 'Client Satisfaction',
                      ),
                      _StatCard(
                        number: '50+',
                        label: 'Happy Clients',
                      ),
                      _StatCard(
                        number: '2M+',
                        label: 'Sq. Ft. Cleaned',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),

            // CTA Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                children: [
                  Text(
                    'Ready for Your Project?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Let\'s discuss your cleaning needs and create a custom solution for you',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 32),
                  GestureDetector(
                    onTap: () => context.go('/contact'),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Start Your Project',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const AppFooter(),
          ],
        ),
    );
  }

  List<Project> _getProjects() {
    return [
      Project(
        id: '1',
        title: 'Corporate Office Complex Renovation',
        description: 'Complete deep cleaning and maintenance of a 50,000 sq ft office complex',
        category: 'COMMERCIAL',
        client: 'Kampala Business Center',
        imageUrl:
            'assets/services/road cleaning.jpg',
        services: ['Deep Cleaning', 'Maintenance', 'Carpet Cleaning'],
        outcome: 'Increased office cleanliness standards by 95%, improved employee satisfaction',
        completionDate: 'March 2024',
        testimonial:
            'Insta Wash provided exceptional service. Our office has never looked better!',
        testimonialAuthor: 'John Ssemakula, Office Manager',
      ),
      Project(
        id: '2',
        title: 'Manufacturing Facility Cleaning',
        description: 'INDUSTRIAL-scale cleaning for manufacturing plant maintenance',
        category: 'INDUSTRIAL',
        client: 'Uganda INDUSTRIAL Works',
        imageUrl:
            'assets/services/office cleaning.jpg',
        services: ['INDUSTRIAL Cleaning', 'Equipment Maintenance', 'Floor Cleaning'],
        outcome: 'Production efficiency improved by 15% through better facility maintenance',
        completionDate: 'February 2024',
        testimonial:
            'Professional and thorough. They exceeded our expectations in every way.',
        testimonialAuthor: 'Emmanuel Okafor, Plant Manager',
      ),
      Project(
        id: '3',
        title: 'RESIDENTIAL Estate Development',
        description: 'Complete cleaning for 200-unit RESIDENTIAL estate',
        category: 'RESIDENTIAL',
        client: 'Kampala Heights Estate',
        imageUrl:
            'assets/services/outdoor cleaning.jpg',
        services: ['RESIDENTIAL Cleaning', 'Landscaping', 'Window Cleaning'],
        outcome: 'Estate residents 100% satisfied, zero complaints received',
        completionDate: 'January 2024',
        testimonial: 'Insta Wash is our go-to cleaning partner. Reliable and efficient!',
        testimonialAuthor: 'Sarah Namukasa, Estate Administrator',
      ),
      Project(
        id: '4',
        title: 'Shopping Mall Deep Clean',
        description: 'Comprehensive cleaning of large shopping center',
        category: 'COMMERCIAL',
        client: 'Nairobi Plaza Kampala',
        imageUrl:
            'assets/services/road cleaning.jpg',
        services: ['Deep Cleaning', 'Floor Polishing', 'Restroom Sanitization'],
        outcome: 'Customer traffic increased by 20% due to improved cleanliness',
        completionDate: 'December 2023',
        testimonial: 'Outstanding attention to detail. Highly professional team.',
        testimonialAuthor: 'David Kakooza, Facility Director',
      ),
      Project(
        id: '5',
        title: 'Hospital Sanitization Project',
        description: 'Medical-grade cleaning and sanitization for healthcare facility',
        category: 'Special',
        client: 'Kampala Medical Hospital',
        imageUrl:
            'assets/services/office cleaning.jpg',
        services: ['Medical Sanitization', 'Pest Control', 'Specialized Cleaning'],
        outcome: 'Hospital infection rates reduced by 40%, patient satisfaction improved',
        completionDate: 'November 2023',
        testimonial:
            'Expertise in healthcare cleaning standards was invaluable. Highly recommended.',
        testimonialAuthor: 'Dr. Robert Musigire, Director',
      ),
      Project(
        id: '6',
        title: 'Car Fleet Detailing Service',
        description: 'Monthly maintenance cleaning for corporate vehicle fleet',
        category: 'Special',
        client: 'Kampala Transport Solutions',
        imageUrl:
            'assets/services/car exterior cleaning.jpg',
        services: ['Auto Detailing', 'Fleet Maintenance', 'Deep Cleaning'],
        outcome: 'Fleet vehicle lifespan extended, professional appearance maintained',
        completionDate: 'October 2023',
        testimonial:
            'The most reliable auto cleaning service we\'ve found. Consistent quality.',
        testimonialAuthor: 'Moses Kamya, Fleet Manager',
      ),
      Project(
        id: '7',
        title: 'School Campus Cleaning Program',
        description: 'Monthly comprehensive cleaning for educational institution',
        category: 'RESIDENTIAL',
        client: 'St. Mary\'s School Kampala',
        imageUrl:
            'https://images.unsplash.com/photo-1427504494937-7e6d6813fd30?w=600&h=600&fit=crop',
        services: ['Facility Cleaning', 'Yard Maintenance', 'Sanitization'],
        outcome: 'School cleanliness ratings improved to A+ standard',
        completionDate: 'September 2023',
        testimonial:
            'Students and staff appreciate the clean learning environment. Thank you!',
        testimonialAuthor: 'Principal Grace Nantume',
      ),
      Project(
        id: '8',
        title: 'Restaurant Kitchen Deep Clean',
        description: 'Professional kitchen cleaning and sanitization for fine dining restaurant',
        category: 'COMMERCIAL',
        client: 'The Pearl Restaurant',
        imageUrl:
            'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=600&h=600&fit=crop',
        services: ['Kitchen Cleaning', 'Degreasing', 'HACCP Compliance'],
        outcome: 'Food safety inspection passed with distinction',
        completionDate: 'August 2023',
        testimonial: 'Professional team with food safety expertise. Excellent service!',
        testimonialAuthor: 'Chef Michael Sebatta',
      ),
      Project(
        id: '9',
        title: 'Data Center Facility Cleaning',
        description: 'Specialized cleaning for critical tech infrastructure',
        category: 'INDUSTRIAL',
        client: 'Kampala Tech Park',
        imageUrl:
            'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=600&h=600&fit=crop',
        services: ['Specialized Cleaning', 'Dust Control', 'CRAC Maintenance'],
        outcome: 'Equipment performance optimized, downtime reduced by 30%',
        completionDate: 'July 2023',
        testimonial: 'Only team trusted to clean our critical infrastructure. Highly skilled.',
        testimonialAuthor: 'Tech Director Samuel Okwonga',
      ),
    ];
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;
  final int delay;

  const _ProjectCard({
    required this.project,
    required this.delay,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  ImageProvider _getImageProvider(String imageUrl) {
    if (imageUrl.startsWith('assets/')) {
      return AssetImage(imageUrl);
    } else {
      return NetworkImage(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.lightGrey,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? AppColors.primary.withOpacity(0.15)
                    : Colors.black.withOpacity(0.05),
                blurRadius: _isHovered ? 25 : 10,
                offset: _isHovered ? const Offset(0, 12) : const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Container
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: AppColors.lightGrey,
                    image: DecorationImage(
                      image: _getImageProvider(widget.project.imageUrl),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {},
                    ),
                  ),
                  child: widget.project.imageUrl.isEmpty
                      ? Center(
                          child: Icon(
                            Icons.image,
                            size: 60,
                            color: AppColors.mediumGrey,
                          ),
                        )
                      : null,
                ),
              ),

              // Project Info
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        widget.project.category,
                        style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.project.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.project.client,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.mediumGrey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (_isHovered)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: AppColors.lightGrey,
                            height: 12,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Outcome',
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.project.outcome,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: AppColors.mediumGrey,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        )
            .animate(delay: Duration(milliseconds: widget.delay))
            .fadeIn(duration: 600.ms)
            .slideY(begin: 0.3),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String number;
  final String label;

  const _StatCard({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.mediumGrey,
          ),
        ),
      ],
    );
  }
}
