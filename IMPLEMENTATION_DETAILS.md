## 🎨 Features & Components

### Pages (7 Routes)

#### 1. **Home Page** (`/`)
- **Hero Section** - Animated gradient background with engaging tagline
- **Stats Showcase** - Years of experience, clients, staff, projects
- **Features Grid** - 6 key selling points with icons
- **Services Preview** - Grid of 8 featured services
- **Testimonials** - 3 client reviews with ratings
- **CTA Section** - Green gradient call-to-action

#### 2. **Services Page** (`/services`)
- **Category Filtering** - Filter by service type
- **Advanced Grid** - Responsive service card layout
- **Detailed Categories** - Sections for each service type with descriptions
- **Search & Sort** - Dynamic filtering with state management

#### 3. **Auto Cleaning Page** (`/auto-cleaning`)
- **Before/After Gallery** - Service transformation showcase
- **Package Cards** - 4 service tiers with features
- **Process Timeline** - Step-by-step service flow
- **Interactive Hover Effects** - Premium package highlighting

#### 4. **Laundry Page** (`/laundry`)
- **Process Timeline** - 4-step laundry workflow visualization
- **Subscription Plans** - 3-tier pricing models
  - Starter: 2 pickups/month
  - Premium: Weekly pickups (popular)
  - Elite: Unlimited service
- **Feature Checklist** - Service highlights

#### 5. **WASTE MANAGEMENT Page** (`/waste`)
- **Overview Cards** - Service benefits
- **Waste Categories** - 8 types handled
- **Subscription Plans** - Home, Business, Enterprise tiers
- **Impact Stats** - Environmental achievements
  - 500+ tons recycled
  - 1000+ families served
  - 95% recycled rate

#### 6. **Contact Page** (`/contact`)
- **Contact Information** - Address, phone, email
- **Social Links** - Facebook, Instagram, Twitter, WhatsApp
- **Contact Form** - Name, email, phone, message with validation
- **Responsive Layout** - Side-by-side on desktop, stacked on mobile

#### 7. **Booking Page** (`/booking`)
- **Multi-Step Form** (4 steps):
  1. Service selection with cards
  2. Date picker & time slots
  3. Customer details (name, email, phone, location, notes)
  4. Order confirmation with summary
- **Step Indicators** - Visual progress bar
- **Real-time Validation** - Form field validation
- **Price Display** - Estimated cost calculation

---

## 🎯 UI/UX Features

### Design System
- **Color Palette**:
  - Primary: #0066CC (Professional Blue)
  - Secondary: #00AA33 (Natural Green)
  - Accent: #FFBB00 (Warm Gold)
  - Neutrals: Grayscale for semantic use

- **Typography**:
  - Font: Google Fonts "Poppins"
  - Sizes: Responsive from 12px to 56px
  - Weights: 400, 500, 600, 700, 800

### Advanced Animations
- ✨ **Fade In** - Page content fade-in on load
- 📊 **Slide Y** - Elements slide in from top/bottom
- 🔄 **Scale** - Hover animations on cards
- 🎯 **Stagger** - Grid items animate sequentially
- 💫 **Rotate** - Decorative background elements

### Responsive Breakpoints
```
Mobile:        < 800px  (single column layouts)
Tablet:   800-1200px    (2-3 column layouts)
Desktop:   > 1200px     (4-column layouts)
```

### Interactive Elements
- 🎨 **Service Cards** - Hover -> lift effect + shadow
- 📋 **Subscription Cards** - Border color change on hover
- 🔘 **Buttons** - Smooth color transitions
- 📌 **Category Chips** - Active state highlighting
- ⏱️ **Time Slots** - Selection with color feedback
- 🔗 **Navigation Links** - Underline animation on hover

---

## 💾 State Management (Riverpod)

### Providers

```dart
// Services
servicesProvider              → List<Service>
filteredServicesProvider      → Filtered by category
selectedServiceProvider       → Current booking service

// Booking
bookingFormProvider          → Form data state
serviceFilterProvider        → Active category filter
loadingProvider              → Loading state
```

### Usage Pattern
```dart
// Reading
final services = ref.watch(servicesProvider);

// Modifying
ref.read(selectedServiceProvider.notifier).state = service;
```

---

## 🧭 Navigation (GoRouter)

Routes are centralized in `core/router/app_router.dart`:

```
/                    → Home
/services            → Services Catalog
/auto-cleaning       → Auto Cleaning
/laundry             → Laundry Service
/waste               → WASTE MANAGEMENT
/contact             → Contact Us
/booking             → Booking System
```

---

## 📦 Dependencies

### Core UI
- `flutter_animate: ^4.5.0` - Smooth animations
- `animations: ^2.0.11` - Material animations
- `google_fonts: ^6.2.1` - Premium typography

### Navigation & State
- `go_router: ^14.2.0` - Routing
- `flutter_riverpod: ^2.5.1` - State management

### Responsiveness
- `responsive_framework: ^1.1.1` - Breakpoint handling
- `flutter_staggered_grid_view: ^0.7.0` - Grid layouts

### Utilities
- `intl: ^0.19.0` - Date formatting
- `uuid: ^4.0.0` - ID generation
- `http: ^1.1.0` - HTTP requests

### Future (Firebase)
- `firebase_core: ^3.6.0`
- `cloud_firestore: ^5.4.4`
- `firebase_auth: ^5.3.1`

---

## 🚀 Quick Start

### 1. Setup
```bash
# Run the setup script
./setup.bat

# OR manually:
flutter pub get
```

### 2. Development
```bash
flutter run -d chrome
```

### 3. Production Build
```bash
flutter build web --release
```

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── theme/           # Colors, typography, theme data
│   ├── models/          # Data models (Service, Booking)
│   ├── constants/       # App-wide constants
│   ├── providers/       # Riverpod state management
│   └── router/          # GoRouter configuration
├── features/
│   ├── home/
│   ├── services/
│   ├── auto_cleaning/
│   ├── laundry/
│   ├── waste/
│   ├── contact/
│   └── booking/
├── shared/
│   └── widgets/         # Reusable components
└── main.dart            # Entry point
```

---

## 🔑 Key Implementation Details

### Responsive Design
- Uses `MediaQuery` to detect screen size
- `isMobile = width < 800px`
- Conditional grid columns: `crossAxisCount: isMobile ? 1 : 3`

### Animations
```dart
.animate()
  .fadeIn(duration: 600.ms)
  .slideY(begin: 0.2)
```

### Theme Access
```dart
// Get theme anywhere
AppColors.primary
AppColors.info
GoogleFonts.poppins(...)
```

### Navigation
```dart
// Navigate
context.go('/services')

// Get back
context.pop()
```

---

## 🔮 Next Steps & Enhancements

### Phase 1: Data Integration
- [ ] Connect Firestore for bookings
- [ ] Setup Firebase Authentication
- [ ] Real-time booking confirmations

### Phase 2: Advanced Features
- [ ] Email notifications
- [ ] Payment integration (Stripe/Flutterwave)
- [ ] Admin dashboard
- [ ] User accounts & history

### Phase 3: Mobile & SEO
- [ ] Flutter mobile app
- [ ] SEO Meta tags
- [ ] Image optimization
- [ ] Firebase Hosting deployment

---

## 🎓 Best Practices Used

✅ **Clean Architecture** - Separated concerns with features folder  
✅ **SOLID Principles** - Single responsibility, DRY code  
✅ **State Management** - Riverpod for reactive updates  
✅ **Reusable Components** - DRY widget composition  
✅ **Theming System** - Centralized design tokens  
✅ **Responsive Design** - Mobile-first approach  
✅ **Error Handling** - Form validation & UI feedback  
✅ **Performance** - Lazy loading & optimized rebuilds  

---

## 📝 File Descriptions

| File | Purpose |
|------|---------|
| `app_colors.dart` | Color palette and gradients |
| `app_theme.dart` | Theme data and text styles |
| `app_router.dart` | Route definitions |
| `providers.dart` | State management |
| `app_header.dart` | Header/footer components |
| `service_card.dart` | Card components |
| `*_page.dart` | Feature pages |

---

## 💡 Quick Tips

### Adding a New Page
1. Create folder in `features/` 
2. Create `pages/` subfolder
3. Build page widget with `AppHeader()` + `AppFooter()`
4. Add route in `app_router.dart`
5. Add navigation link in header

### Styling Components
```dart
// Use theme colors
backgroundColor: AppColors.primary

// Use fonts
style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)

// Use spacing
padding: EdgeInsets.all(20)
```

### State Updates
```dart
// Watch for changes
final services = ref.watch(servicesProvider);

// Update state
ref.read(provider.notifier).state = newValue;
```

---

## 🤝 Contributing

When adding features:
1. Follow the existing project structure
2. Use the centralized theme system
3. Add animations where appropriate
4. Test on multiple screen sizes
5. Use semantic colors and naming

---

## 📞 Support

**Email**: info@intawashuganda.ug  
**Phone**: +256 741 074382  
**WhatsApp**: +256 741 074382

---

**Version**: 1.0.0  
**Last Updated**: April 2024  
**License**: © 2024 Insta Wash Uganda. All rights reserved.