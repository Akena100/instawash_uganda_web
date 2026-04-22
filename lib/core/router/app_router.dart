import 'package:go_router/go_router.dart';
import 'package:intawashuganda/core/models/video_model.dart';
import 'package:intawashuganda/features/home/pages/home_page.dart';
import 'package:intawashuganda/features/services/pages/services_page.dart';
import 'package:intawashuganda/features/service_detail/pages/service_detail_page.dart';
import 'package:intawashuganda/features/auto_cleaning/pages/auto_cleaning_page.dart';
import 'package:intawashuganda/features/laundry/pages/laundry_page.dart';
import 'package:intawashuganda/features/waste/pages/waste_page.dart';
import 'package:intawashuganda/features/subsidiaries/pages/subsidiaries_page.dart';
import 'package:intawashuganda/features/faq/pages/faq_page.dart';
import 'package:intawashuganda/features/privacy/pages/privacy_page.dart';
import 'package:intawashuganda/features/terms/pages/terms_page.dart';
import 'package:intawashuganda/features/contact/pages/contact_page.dart';
import 'package:intawashuganda/features/team/pages/team_page.dart';
import 'package:intawashuganda/features/projects/pages/projects_page.dart';
import 'package:intawashuganda/features/gallery/pages/gallery_page.dart';
import 'package:intawashuganda/features/about/pages/about_page.dart';

class AppRouter {
  static const String home = '/';
  static const String services = '/services';
  static const String serviceDetail = '/service/:id';
  static const String autoCleaning = '/auto-cleaning';
  static const String laundry = '/laundry';
  static const String waste = '/waste';
  static const String subsidiaries = '/subsidiaries';
  static const String faq = '/faq';
  static const String privacy = '/privacy';
  static const String terms = '/terms';
  static const String about = '/about';
  static const String projects = '/projects';
  static const String contact = '/contact';
  static const String team = '/team';
  static const String gallery = '/gallery';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(path: home, builder: (context, state) => const HomePage()),
      GoRoute(
        path: services,
        builder: (context, state) => const ServicesPage(),
      ),
      GoRoute(
        path: serviceDetail,
        builder: (context, state) {
          final serviceId = state.pathParameters['id']!;
          return ServiceDetailPage(serviceId: serviceId);
        },
      ),
      GoRoute(
        path: autoCleaning,
        builder: (context, state) => const AutoCleaningPage(),
      ),
      GoRoute(path: laundry, builder: (context, state) => const LaundryPage()),
      GoRoute(path: waste, builder: (context, state) => const WastePage()),
      GoRoute(
        path: subsidiaries,
        builder: (context, state) => const SubsidiariesPage(),
      ),
      GoRoute(path: faq, builder: (context, state) => const FAQPage()),
      GoRoute(path: privacy, builder: (context, state) => const PrivacyPage()),
      GoRoute(path: terms, builder: (context, state) => const TermsPage()),
      GoRoute(path: contact, builder: (context, state) => const ContactPage()),
      GoRoute(path: team, builder: (context, state) => const TeamPage()),
      GoRoute(
        path: projects,
        builder: (context, state) => const ProjectsPage(),
      ),
      GoRoute(path: about, builder: (context, state) => const AboutPage()),
      GoRoute(
        path: gallery,
        builder: (context, state) {
          final extra = state.extra;
          Video? initialVideo;
          if (extra is Video) {
            initialVideo = extra;
          }
          return GalleryPage(initialVideo: initialVideo);
        },
      ),
    ],
  );
}
