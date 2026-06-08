# 🔧 Quick Developer Reference

## Project Initialization

```bash
# Run setup (Windows)
./setup.bat

# OR manually:
cd ~/Projects/intawashuganda
flutter pub get
flutter run -d chrome
```

## Folder Structure Quick Reference

```
intawashuganda/
├── lib/
│   ├── core/              # App infrastructure
│   │   ├── theme/
│   │   ├── models/
│   │   ├── constants/
│   │   ├── providers/
│   │   └── router/
│   ├── features/          # Feature modules
│   │   ├── home/
│   │   ├── services/
│   │   ├── auto_cleaning/
│   │   ├── laundry/
│   │   ├── waste/
│   │   ├── contact/
│   │   └── booking/
│   ├── shared/            # Shared widgets
│   │   └── widgets/
│   └── main.dart
├── web/                   # Web config
├── pubspec.yaml           # Dependencies
├── setup.bat              # Windows setup
├── README.md              # Project overview
├── DEVELOPMENT_GUIDE.md   # Dev guide
└── IMPLEMENTATION_DETAILS.md # Technical details
```

## Common Tasks

### Run Development Server
```bash
flutter run -d chrome
```

### Build for Production
```bash
flutter build web --release
```

### Get New Dependencies
```bash
flutter pub get
flutter pub upgrade
```

### Format Code
```bash
dart format lib/
```

### Analyze Code
```bash
dart analyze
```

## Color Palette Reference

```dart
// Use in your widgets
AppColors.primary        // #0066CC (Blue)
AppColors.info      // #00AA33 (Green)
AppColors.accent         // #FFBB00 (Gold)
AppColors.white          // #FFFFFF
AppColors.darkGrey       // #333333
AppColors.mediumGrey     // #666666
AppColors.lightGrey      // #F5F5F5
AppColors.borderGrey     // #E0E0E0
```

## Typography Reference

```dart
// All use Poppins font family

// Display
GoogleFonts.poppins(fontSize: 56, fontWeight: FontWeight.w800)

// Heading
GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.w700)

// Title
GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600)

// Body
GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400)

// Small
GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400)
```

## Animation Snippets

### Fade In
```dart
.animate()
  .fadeIn(duration: 600.ms)
```

### Slide & Fade
```dart
.animate()
  .fadeIn(duration: 600.ms)
  .slideY(begin: 0.2)
```

### On Hover Scale
```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  transform: Matrix4.identity()
    ..scale(_isHovered ? 1.02 : 1.0),
  child: child,
)
```

## State Management Examples

### Reading State
```dart
final services = ref.watch(servicesProvider);
final selectedService = ref.watch(selectedServiceProvider);
```

### Updating State
```dart
ref.read(selectedServiceProvider.notifier).state = newService;
ref.read(serviceFilterProvider.notifier).state = "RESIDENTIAL";
```

### Creating Providers
```dart
// Simple provider
final myProvider = Provider<String>((ref) => "value");

// State provider
final counter = StateProvider<int>((ref) => 0);

// Computed provider
final filtered = Provider<List>((ref) {
  final items = ref.watch(itemsProvider);
  return items.where((item) => item.active).toList();
});
```

## Navigation Examples

### Navigate To
```dart
context.go('/services');
context.go('/booking');
```

### Get Back
```dart
context.pop();
```

### Query Parameters (if needed)
```dart
context.go('/booking?service=home-cleaning');
```

## Responsive Breakpoints

```dart
final isMobile = MediaQuery.of(context).size.width < 800;
final isTablet = MediaQuery.of(context).size.width < 1200;
final isDesktop = MediaQuery.of(context).size.width >= 1200;
```

## Form Validation Example

```dart
TextField(
  controller: _nameController,
  decoration: InputDecoration(
    labelText: 'Full Name',
    filled: true,
    fillColor: AppColors.lightGrey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColors.borderGrey),
    ),
  ),
)
```

## Icon Usage

```dart
// Material Icons
Icon(Icons.check_circle, color: AppColors.primary)
Icon(Icons.star_rounded, color: AppColors.accent)
Icon(Icons.arrow_forward, color: AppColors.white)

// Text emoji
Text('🚗', style: const TextStyle(fontSize: 32))
```

## Container Styling Pattern

```dart
Container(
  padding: const EdgeInsets.all(24),
  decoration: BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: AppColors.borderGrey),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 8,
        offset: const Offset(0, 2),
      )
    ],
  ),
  child: child,
)
```

## Grid/List Layout Patterns

### Grid
```dart
GridView.count(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  crossAxisCount: isMobile ? 1 : 3,
  mainAxisSpacing: 24,
  crossAxisSpacing: 24,
  children: items.map((item) => ItemWidget(item)).toList(),
)
```

### Responsive Row/Column
```dart
isMobile
  ? Column(children: widgets)
  : Row(children: widgets)
```

## Common Imports

```dart
// Material UI
import 'package:flutter/material.dart';

// Riverpod
import 'package:flutter_riverpod/flutter_riverpod.dart';

// GoRouter
import 'package:go_router/go_router.dart';

// Animations
import 'package:flutter_animate/flutter_animate.dart';

// Fonts
import 'package:google_fonts/google_fonts.dart';

// Date formatting
import 'package:intl/intl.dart';

// App imports
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/core/providers/providers.dart';
```

## Page Template

```dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intawashuganda/core/theme/app_colors.dart';
import 'package:intawashuganda/shared/widgets/app_header.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AppHeader(),
            // Your content here
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: 40,
              ),
              child: Column(
                children: [
                  // Content
                ],
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}
```

## Debugging Tips

### Print State Changes
```dart
debugPrint('Value: $value');
```

### Inspect Widget Tree
- Press **D** in Flutter console

### Check Errors
```bash
flutter analyze
```

### Get Device Info
```dart
print(MediaQuery.of(context).size);
print(Theme.of(context).platform);
```

## Performance Tips

✅ Use `const` constructors  
✅ Use `SingleChildScrollView` for scrollable content  
✅ Use `NeverScrollableScrollPhysics()` for nested scrolls  
✅ Use `shrinkWrap: true` for GridView inside Column  
✅ Use `ListView.builder` for large lists  
✅ Wrap heavy widgets with `Visibility`  

## String Formatting

```dart
// Date
DateFormat('MMM dd, yyyy').format(date)
DateFormat('hh:mm a').format(time)

// Number
toStringAsFixed(2)
(value / 1000).toStringAsFixed(0) + 'k'
```

## URL Patterns (When Adding Links)

```dart
// Navigation
context.go('/services')
context.go('/booking?service=cleaning')

// External links (future)
// launchUrl(Uri.parse('https://...')
```

---

## 📚 Resources

- **Flutter Docs**: https://flutter.dev/docs
- **GoRouter**: https://pub.dev/packages/go_router
- **Riverpod**: https://riverpod.dev
- **Google Fonts**: https://fonts.google.com

---

**Happy Coding! 🚀**
