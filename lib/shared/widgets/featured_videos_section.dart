import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intawashuganda/core/providers/providers.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/video_card.dart';

/// Featured videos section for home page
class FeaturedVideosSection extends ConsumerWidget {
  final bool isMobile;

  const FeaturedVideosSection({
    super.key,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videos = ref.watch(featuredVideosProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: isDarkMode ? const Color(0xFF0F1419) : Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 40,
        vertical: 60,
      ),
      child: Column(
        children: [
          // Section Header
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.info.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: AppColors.info.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Text(
                  'OUR GALLERY',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                    color: AppColors.info,
                  ),
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 100.ms),
              const SizedBox(height: 16),
              Text(
                'Watch Our Professional Services in Action',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 28 : 40,
                  fontWeight: FontWeight.w800,
                  color: isDarkMode ? Colors.white : Colors.black,
                  height: 1.2,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 150.ms),
              const SizedBox(height: 12),
              Text(
                'Explore our collection of videos showcasing professional cleaning and services across various sectors',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: isMobile ? 14 : 16,
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.7)
                      : Colors.black.withOpacity(0.6),
                  height: 1.6,
                ),
              )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 200.ms),
            ],
          ),
          const SizedBox(height: 48),

          // Videos Grid
          if (videos.isNotEmpty)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 3,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 16 / 9,
              ),
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return VideoCard(
                  video: video,
                  onTap: () {
                    context.push('/gallery', extra: video);
                  },
                )
                    .animate()
                    .fadeIn(
                      duration: 600.ms,
                      delay: Duration(milliseconds: 300 + (index * 100)),
                    )
                    .slideY(
                      begin: 0.2,
                      end: 0,
                      duration: 600.ms,
                      delay: Duration(milliseconds: 300 + (index * 100)),
                    );
              },
            )
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  'No videos available',
                  style: TextStyle(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.5)
                        : Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),

          const SizedBox(height: 48),

          // View All Button
          ElevatedButton.icon(
            onPressed: () => context.push('/gallery'),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('View Full Gallery'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms, delay: 600.ms)
              .slideY(begin: 0.2, end: 0, duration: 600.ms, delay: 600.ms),
        ],
      ),
    );
  }
}
