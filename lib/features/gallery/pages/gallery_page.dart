import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intawashuganda/core/models/video_model.dart';
import 'package:intawashuganda/core/providers/providers.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_footer.dart';
import 'package:intawashuganda/shared/widgets/app_header.dart';
import 'package:intawashuganda/shared/widgets/web_video_player.dart';
import 'package:intawashuganda/shared/widgets/video_card.dart';


class GalleryPage extends ConsumerStatefulWidget {
  final Video? initialVideo;

  const GalleryPage({super.key, this.initialVideo});

  @override
  ConsumerState<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends ConsumerState<GalleryPage> {
  late Video? selectedVideo;
  late int tabIndex;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    selectedVideo = widget.initialVideo;
    tabIndex = 0;
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allVideos = ref.watch(videosProvider);
    final allPictures = ref.watch(picturesProvider);
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (selectedVideo == null && allVideos.isNotEmpty) {
      Future.microtask(() {
        if (mounted) {
          setState(() => selectedVideo = allVideos.first);
        }
      });
    }

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF0F1419) : Colors.white,
      body: Column(
        children: [
          const _GalleryHeader(),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Hero Section
                  Container(
                    width: double.infinity,
                    color: isDarkMode ? const Color(0xFF1A2332) : AppColors.lightGrey,
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 60),
                    child: Column(
                      children: [
                        Text('Our Gallery',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: isMobile ? 32 : 48,
                              fontWeight: FontWeight.w800,
                              color: isDarkMode ? Colors.white : Colors.black,
                            )),
                        const SizedBox(height: 12),
                        Text('Explore our videos and portfolio',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: isDarkMode ? Colors.white.withOpacity(0.7) : Colors.black.withOpacity(0.6),
                            )),
                      ],
                    ),
                  ),
                  // Content Container
                  Container(
                    color: isDarkMode ? const Color(0xFF0F1419) : Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40, vertical: 40),
                    child: Column(
                      children: [
                  // Tab Buttons
                  Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF1A2332) : Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
                      ),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: Row(
                      children: [
                        Expanded(
                          child: _TabButton(
                            label: '🎬 Videos',
                            isActive: tabIndex == 0,
                            onTap: () => setState(() => tabIndex = 0),
                            isDark: isDarkMode,
                          ),
                        ),
                        Expanded(
                          child: _TabButton(
                            label: '🖼️ Pictures',
                            isActive: tabIndex == 1,
                            onTap: () => setState(() => tabIndex = 1),
                            isDark: isDarkMode,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Videos Tab
                  if (tabIndex == 0) ...[
                    if (selectedVideo != null) ...[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Video Player
                          WebVideoPlayer(
                            key: ObjectKey(selectedVideo),
                            youtubeId: selectedVideo!.youtubeId,
                            title: selectedVideo!.title,
                            description: selectedVideo!.description,
                            relatedVideos: allVideos.where((v) => v.id != selectedVideo!.id).toList(),
                            onVideoChange: (youtubeId) {
                              final video = allVideos.firstWhere((v) => v.youtubeId == youtubeId, orElse: () => selectedVideo!);
                              setState(() => selectedVideo = video);
                              // Scroll to top
                              _scrollController.animateTo(
                                0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ],
                    // Videos Grid
                    Text(
                      'All Videos (${allVideos.length})',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 1 : 3,
                        crossAxisSpacing: 24,
                        mainAxisSpacing: 24,
                        childAspectRatio: 16 / 10,
                      ),
                      itemCount: allVideos.length,
                      itemBuilder: (context, index) {
                        final video = allVideos[index];
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: selectedVideo?.id == video.id
                                ? Border.all(color: AppColors.primary, width: 3)
                                : null,
                          ),
                          child: VideoCard(
                            video: video,
                            onTap: () {
                              setState(() => selectedVideo = video);
                              // Scroll to top
                              _scrollController.animateTo(
                                0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                  // Pictures Tab
                  if (tabIndex == 1) ...[
                    // Places Section
                    Text(
                      'SOME OF OUR BIG CLIENTS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final picture = allPictures[index];
                        return _PictureCard(picture: picture, isDark: isDarkMode, showTitle: true);
                      },
                    ),
                    const SizedBox(height: 60),
                    // Portfolio Section
                    Text(
                      'Our Portfolio (${allPictures.length - 4})',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 24),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isMobile ? 2 : 4,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                      ),
                      itemCount: allPictures.length - 4,
                      itemBuilder: (context, index) {
                        final picture = allPictures[index + 4];
                        return _PictureCard(picture: picture, isDark: isDarkMode, showTitle: false);
                      },
                    ),
                  ],
                ],
              ),
            ),
            const AppFooter(),
                ],
              ),
            ),
      )],
        ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final bool isDark;

  const _TabButton({
    required this.label,
    required this.isActive,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isActive
                  ? Colors.white
                  : isDark
                      ? Colors.white.withOpacity(0.6)
                      : Colors.black.withOpacity(0.6),
            ),
          ),
        ),
      ),
    );
  }
}

class _GalleryHeader extends StatelessWidget {
  const _GalleryHeader();

  @override
  Widget build(BuildContext context) {
    return const AppHeader(isTransparent: false);
  }
}

class _PictureCard extends StatefulWidget {
  final dynamic picture;
  final bool isDark;
  final bool showTitle;

  const _PictureCard({
    required this.picture,
    required this.isDark,
    this.showTitle = false,
  });

  @override
  State<_PictureCard> createState() => _PictureCardState();
}

class _PictureCardState extends State<_PictureCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        widget.picture.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.isDark ? Colors.grey[800]! : Colors.grey[300]!,
            ),
            boxShadow: [
              if (_isHovering)
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
            ],
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  widget.picture.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: widget.isDark ? const Color(0xFF1A2332) : Colors.grey[200],
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: widget.isDark ? Colors.grey[600] : Colors.grey[400],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Overlay on hover
              if (_isHovering)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black.withOpacity(0.4),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.zoom_in,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ),
              // Gradient overlay with title at bottom (only for Places)
              if (widget.showTitle)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    child: Text(
                      widget.picture.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
