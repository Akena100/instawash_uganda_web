import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intawashuganda/core/router/app_router.dart';
import 'package:intawashuganda/core/theme/app_theme.dart';
import 'package:intawashuganda/core/providers/providers.dart';
import 'package:intawashuganda/shared/widgets/custom_cursor_overlay.dart';
import 'package:intawashuganda/shared/widgets/floating_whatsapp_button.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set up URL strategy for clean URLs (removes hash from routes)
  setPathUrlStrategy();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    // Firebase might already be initialized on web
    debugPrint('Firebase initialization error (may already be initialized): $e');
  }
  
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: 'Insta Wash Uganda',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        // Wrap with custom cursor overlay on desktop platforms and web desktop browsers only.
        // Disable on mobile web and mobile apps since touch screens do not use a cursor.
        bool shouldShowCursor = (_isDesktopPlatform() || _isWebDesktopPlatform()) && child != null;
        
        Widget wrappedChild = child ?? const SizedBox();
        
        if (shouldShowCursor) {
          wrappedChild = CustomCursorOverlay(child: wrappedChild);
        }
        
        // Add WhatsApp floating button on top of all pages
        return Stack(
          children: [
            wrappedChild,
            const FloatingWhatsAppButton(
              phoneNumber: '256741074382', // Replace with your WhatsApp number
            ),
          ],
        );
      },
    );
  }

  // Helper function to check if running on desktop platform (Windows, macOS, Linux)
  static bool _isDesktopPlatform() {
    try {
      return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
    } catch (e) {
      return false;
    }
  }

  // Helper function to detect web desktop browsers and exclude mobile web browsers
  static bool _isWebDesktopPlatform() {
    if (!kIsWeb) return false;
    return defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux;
  }
}
