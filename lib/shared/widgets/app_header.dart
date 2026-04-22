import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/constants/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/core/providers/providers.dart';

class AppHeader extends ConsumerStatefulWidget {
  final bool isTransparent;

  const AppHeader({super.key, this.isTransparent = false});

  @override
  ConsumerState<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends ConsumerState<AppHeader> {
  final bool _scrollAwareTransparency = true;
  
  Future<void> _openWhatsApp() async {
  final uri = Uri.parse(
    '${AppConstants.whatsappUrl}?text=${Uri.encodeComponent('Hello Insta Wash Uganda! I would like to book a service.')}',
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

  @override
  void initState() {
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final headerBg = isDarkMode
        ? const Color.fromARGB(255, 63, 68, 75)
        : AppColors.white;
    final textColor = isDarkMode ? const Color(0xFFE8EDF7) : AppColors.darkGrey;

    return Container(
      decoration: BoxDecoration(
        color: _scrollAwareTransparency && widget.isTransparent
            ? Colors.transparent
            : headerBg,
        boxShadow: !_scrollAwareTransparency || !widget.isTransparent
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(isDarkMode ? 0.3 : 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go('/'),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo.png',
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 12),
                    if (!isMobile)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'INSTA WASH UGANDA',
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    if (isMobile)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'INSTA WASH UGANDA',
                            style: GoogleFonts.poppins(
                              color: textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            // Navigation Links
            if (!isMobile)
              Row(
                children: [
                  _NavLink(label: 'Home', route: '/'),
                  _NavLink(label: 'Services', route: '/services'),
                  _NavDropdown(
                    label: 'Company',
                    items: const [
                      ('Projects', '/projects'),
                      ('Team', '/team'),
                      ('Subsidiaries', '/subsidiaries'),
                    ],
                  ),
                  _NavLink(label: 'Gallery', route: '/gallery'),
                  _NavLink(label: 'About', route: '/about'),
                  _NavDropdown(
                    label: 'More',
                    items: const [
                      ('Contact', '/contact'),
                      ('FAQ', '/faq'),
                      ('Privacy', '/privacy'),
                      ('Terms', '/terms'),
                    ],
                  ),
                ],
              ),
            // Mobile Menu Button or CTA
            if (isMobile)
              Row(
                children: [
                  _ThemeToggle(ref: ref),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => _showModernMenu(context),
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.menu_rounded,
                          color: AppColors.white,
                          size: 24,
                        ),
                      ),
                    ).animate().fadeIn(duration: 600.ms),
                  ),
                ],
              )
            else
              Row(
                children: [
                  _ThemeToggle(ref: ref),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _openWhatsApp,
                    child: Text(
                      'Book Now',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                  ).animate().fadeIn(duration: 600.ms),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _showModernMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ModernMobileMenu(),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final String route;

  const _NavLink({required this.label, required this.route});

  @override
  State<_NavLink> createState() => __NavLinkState();
}

class __NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final defaultColor = isDarkMode
        ? const Color(0xFFB0BAC9)
        : AppColors.mediumGrey;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child:
            Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: _isHovered
                            ? AppColors.primary
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    widget.label,
                    style: GoogleFonts.poppins(
                      color: _isHovered ? AppColors.primary : defaultColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
                .animate(
                  onPlay: (controller) {
                    if (_isHovered) controller.forward();
                  },
                )
                .fadeIn(),
      ),
    );
  }
}

class _NavDropdown extends StatefulWidget {
  final String label;
  final List<(String, String)> items;

  const _NavDropdown({required this.label, required this.items});

  @override
  State<_NavDropdown> createState() => __NavDropdownState();
}

class __NavDropdownState extends State<_NavDropdown> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final defaultColor = isDarkMode
        ? const Color(0xFFB0BAC9)
        : AppColors.mediumGrey;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: PopupMenuButton<String>(
        tooltip: '',
        onSelected: (route) => context.go(route),
        offset: const Offset(0, 8),
        position: PopupMenuPosition.under,
        color: isDarkMode ? const Color(0xFF1A2332) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        itemBuilder: (context) {
          return widget.items.map((item) {
            return PopupMenuItem<String>(
              value: item.$2,
              child: Text(
                item.$1,
                style: GoogleFonts.poppins(
                  color: isDarkMode
                      ? const Color(0xFFE8EDF7)
                      : AppColors.darkGrey,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: _isHovered
                ? (isDarkMode ? const Color(0xFF131B27) : AppColors.lightGrey)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: GoogleFonts.poppins(
                  color: _isHovered ? AppColors.primary : defaultColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.expand_more,
                color: _isHovered ? AppColors.primary : defaultColor,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DropdownItem extends StatefulWidget {
  final String label;
  final String route;

  const _DropdownItem({required this.label, required this.route});

  @override
  State<_DropdownItem> createState() => __DropdownItemState();
}

class __DropdownItemState extends State<_DropdownItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.primary.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.poppins(
              color: _isHovered
                  ? AppColors.primary
                  : (isDarkMode
                        ? const Color(0xFFB0BAC9)
                        : AppColors.mediumGrey),
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

// Modern Mobile Menu
class ModernMobileMenu extends StatefulWidget {
  const ModernMobileMenu({super.key});

  @override
  State<ModernMobileMenu> createState() => _ModernMobileMenuState();
}

class _ModernMobileMenuState extends State<ModernMobileMenu> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // Prevent closing when tapping inside
      child: DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.7,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 30,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Column(
              children: [
                // Drag Handle
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 20),
                  child: Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Menu',
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkGrey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.close_rounded,
                              color: AppColors.darkGrey,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Menu Content
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      children: [
                        // All Menu Items - Flat Layout
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.home_rounded,
                            label: 'Home',
                            route: '/',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.info_rounded,
                            label: 'About',
                            route: '/about',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.business_rounded,
                            label: 'Services',
                            route: '/services',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.apartment_rounded,
                            label: 'Subsidiaries',
                            route: '/subsidiaries',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.image_rounded,
                            label: 'Projects',
                            route: '/projects',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.people_rounded,
                            label: 'Team',
                            route: '/team',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.video_library_rounded,
                            label: 'Gallery',
                            route: '/gallery',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.phone_rounded,
                            label: 'Contact',
                            route: '/contact',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.help_rounded,
                            label: 'FAQ',
                            route: '/faq',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.privacy_tip_rounded,
                            label: 'Privacy',
                            route: '/privacy',
                          ),
                        ),
                        _MenuItemTile(
                          item: _MenuItem(
                            icon: Icons.description_rounded,
                            label: 'Terms',
                            route: '/terms',
                          ),
                        ),
                        const SizedBox(height: 32),
                        // CTA Button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: GestureDetector(
                            onTap: () async {
                              Navigator.pop(context);
                              final uri = Uri.parse(
                                'https://wa.me/qr/QYARTG3JEE66P1',
                              );
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                );
                              }
                            },
                            child:
                                Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        gradient: AppColors.primaryGradient,
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.primary
                                                .withOpacity(0.3),
                                            blurRadius: 12,
                                            offset: const Offset(0, 8),
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Book Now',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                    .animate()
                                    .fadeIn(duration: 400.ms)
                                    .slideY(begin: 0.3),
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ).animate().fadeIn(duration: 300.ms);
  }
}

// Menu Section Component

// Menu Item Data Model
class _MenuItem {
  final IconData icon;
  final String label;
  final String route;

  _MenuItem({required this.icon, required this.label, required this.route});
}

// Menu Item Tile Component
class _MenuItemTile extends StatefulWidget {
  final _MenuItem item;
  final bool isSubItem;

  const _MenuItemTile({required this.item, this.isSubItem = false});

  @override
  State<_MenuItemTile> createState() => _MenuItemTileState();
}

class _MenuItemTileState extends State<_MenuItemTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: () {
        Navigator.pop(context);
        context.go(widget.item.route);
      },
      child: AnimatedScale(
        scale: _isPressed ? 0.98 : 1,
        duration: const Duration(milliseconds: 100),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: widget.isSubItem ? 36 : 20,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: _isPressed
                ? AppColors.primary.withOpacity(0.08)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Icon(
                    widget.item.icon,
                    color: AppColors.primary,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item.label,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: AppColors.primary.withOpacity(0.6),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Section Title Component

// Expandable Menu Group Component
class _MenuGroupTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<_MenuItem> items;

  const _MenuGroupTile({
    required this.icon,
    required this.title,
    required this.items,
  });

  @override
  State<_MenuGroupTile> createState() => _MenuGroupTileState();
}

class _MenuGroupTileState extends State<_MenuGroupTile>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.lightGrey, width: 1),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() => _isExpanded = !_isExpanded);
              if (_isExpanded) {
                _animationController.forward();
              } else {
                _animationController.reverse();
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Icon(
                        widget.icon,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ),
                  RotationTransition(
                    turns: Tween(
                      begin: 0.0,
                      end: 0.5,
                    ).animate(_animationController),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _isExpanded
                ? Column(
                    children: [
                      Divider(
                        height: 1,
                        color: AppColors.lightGrey,
                        indent: 20,
                        endIndent: 20,
                      ),
                      ...List.generate(
                        widget.items.length,
                        (index) => Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              child: _MenuItemTile(
                                item: widget.items[index],
                                isSubItem: true,
                              ),
                            ),
                            if (index < widget.items.length - 1)
                              Divider(
                                height: 1,
                                color: AppColors.lightGrey,
                                indent: 80,
                                endIndent: 20,
                              ),
                          ],
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _ThemeToggle extends StatefulWidget {
  final WidgetRef ref;

  const _ThemeToggle({required this.ref});

  @override
  State<_ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<_ThemeToggle> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final newMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
          widget.ref.read(themeModeProvider.notifier).state = newMode;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF3A4555)
                      : AppColors.lightGrey
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Icon(
                isDarkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                key: ValueKey(isDarkMode),
                color: isDarkMode ? const Color(0xFFFFD700) : AppColors.primary,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
