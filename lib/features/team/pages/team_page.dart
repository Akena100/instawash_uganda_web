import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/models/team_member_model.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/fixed_header_layout.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isTablet =
        MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width < 1200;

    // Mock team data
    final teamMembers = _getTeamMembers();
    final departments = _getDepartments(teamMembers);

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
                    'Meet Our Team',
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
                      'Dedicated professionals committed to delivering excellence in cleaning services across Uganda',
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

            // Team Members by Department
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                children: List.generate(
                  departments.length,
                  (index) {
                    final dept = departments[index];
                    final deptMembers =
                        teamMembers.where((m) => m.department == dept).toList();

                    return Column(
                      children: [
                        // Department Header
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Column(
                            children: [
                              Text(
                                dept,
                                style: GoogleFonts.poppins(
                                  fontSize: isMobile ? 24 : 32,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.darkGrey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                width: 60,
                                height: 4,
                                decoration: BoxDecoration(
                                  gradient: AppColors.primaryGradient,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ],
                          )
                              .animate()
                              .fadeIn(duration: 600.ms)
                              .slideY(
                                begin: 0.2,
                              ),
                        ),

                        // Team Member Cards Grid
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                isMobile ? 1 : (isTablet ? 2 : 3),
                            mainAxisSpacing: 32,
                            crossAxisSpacing: 32,
                            childAspectRatio: 0.85,
                          ),
                          itemCount: deptMembers.length,
                          itemBuilder: (context, idx) {
                            return _TeamMemberCard(
                              member: deptMembers[idx],
                              delay: idx * 100,
                            );
                          },
                        ),

                        if (index < departments.length - 1)
                          Padding(
                            padding: const EdgeInsets.only(top: 80, bottom: 40),
                            child: Divider(
                              color: AppColors.lightGrey,
                              height: 1,
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),

            // CTA Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: AppColors.secondaryGradient,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 60,
              ),
              child: Column(
                children: [
                  Text(
                    'Join Our Team',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isMobile ? 28 : 36,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'We\'re always looking for talented individuals to join our growing team',
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
                        'Get In Touch',
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

  List<TeamMember> _getTeamMembers() {
    return [
      TeamMember(
        id: '16',
        name: 'Dr. Franklin Higenyi',
        role: 'Chairperson Board / Director',
        department: 'Leadership',
        imageUrl: '',
        bio: 'Providing strategic direction and governance for the board.',
        email: null,
        social: null,
      ),
      TeamMember(
        id: '17',
        name: 'Ziwa Jeff',
        role: 'Founder',
        department: 'Leadership',
        imageUrl: 'assets/team/jeff ziwa.jpeg',
        bio: 'Founder leading the company vision and market growth.',
        email: null,
        social: null,
      ),
      TeamMember(
        id: '18',
        name: 'Mariam Mirembe',
        role: 'Director',
        department: 'Leadership',
        imageUrl: 'assets/team/miriam mirembe.jpeg',
        bio: 'Director supporting executive leadership and operations.',
        email: null,
        social: null,
      ),
      TeamMember(
        id: '19',
        name: 'Ivy Kahunde',
        role: 'Head Operations & HR',
        department: 'Operations',
        imageUrl: '',
        bio: 'Leading people operations and human resources for the company.',
        email: null,
        social: null,
      ),
      TeamMember(
        id: '20',
        name: 'Ashemeza Shyne',
        role: 'Manager Administration',
        department: 'Operations',
        imageUrl: '',
        bio: 'Managing administrative functions and office coordination.',
        email: null,
        social: null,
      ),
    ];
  }

  List<String> _getDepartments(List<TeamMember> members) {
    final depts = members.map((m) => m.department).toSet().toList();
    return depts;
  }
}

class _TeamMemberCard extends StatefulWidget {
  final TeamMember member;
  final int delay;

  const _TeamMemberCard({
    required this.member,
    required this.delay,
  });

  @override
  State<_TeamMemberCard> createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<_TeamMemberCard> {
  bool _isHovered = false;

  ImageProvider? _buildMemberImage(String imageUrl) {
    if (imageUrl.isEmpty) return null;
    if (imageUrl.startsWith('assets/') || imageUrl.startsWith('package:')) {
      return AssetImage(imageUrl);
    }
    return NetworkImage(imageUrl);
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
            children: [
              // Profile Image
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: AppColors.lightGrey,
                    image: _buildMemberImage(widget.member.imageUrl) != null
                        ? DecorationImage(
                            image: _buildMemberImage(widget.member.imageUrl)!,
                            fit: BoxFit.cover,
                            onError: (exception, stackTrace) {},
                          )
                        : null,
                  ),
                  child: _buildMemberImage(widget.member.imageUrl) == null
                      ? Center(
                          child: Icon(
                            Icons.person,
                            size: 60,
                            color: AppColors.mediumGrey,
                          ),
                        )
                      : null,
                ),
              ),

              // Member Info
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.member.name,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: AppColors.darkGrey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.member.role,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.member.bio,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.mediumGrey,
                      ),
                    ),

                    // Social Links + Contact
                    if (_isHovered)
                      Column(
                        children: [
                          const SizedBox(height: 12),
                          Divider(
                            color: AppColors.lightGrey,
                            height: 12,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Email Button
                              if (widget.member.email != null)
                                GestureDetector(
                                  onTap: () {
                                    // Email action
                                  },
                                  child: Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.mail_outline_rounded,
                                        color: AppColors.primary,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                )
                              else
                                const SizedBox(width: 36),

                              // Social Links
                              if (widget.member.social != null &&
                                  widget.member.social!.isNotEmpty)
                                Row(
                                  children: [
                                    if (widget.member.social!['twitter'] != null)
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.share_rounded,
                                              color: AppColors.primary,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    const SizedBox(width: 8),
                                    if (widget.member.social!['linkedin'] !=
                                        null)
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.work_outline_rounded,
                                              color: AppColors.primary,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    const SizedBox(width: 8),
                                    if (widget.member.social!['instagram'] !=
                                        null)
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 36,
                                          height: 36,
                                          decoration: BoxDecoration(
                                            color: AppColors.primary
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.camera_alt_outlined,
                                              color: AppColors.primary,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                            ],
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
