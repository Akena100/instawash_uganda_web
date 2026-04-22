# Insta Wash Uganda - Development Guide

## Project Overview

This is a modern, high-performance Flutter Web Application for **Insta Wash Uganda** - a comprehensive cleaning services company offering residential, commercial, industrial, auto, laundry, and waste management services.

## 🎯 Features

### Pages & Routes
- **Home** (`/`) - Hero section, stats, features, services showcase, testimonials, CTA
- **Services** (`/services`) - Full service catalog with category filtering
- **Auto Cleaning** (`/auto-cleaning`) - Mobile auto detailing showcase and packages
- **Laundry** (`/laundry`) - Professional laundry services with subscription plans
- **Waste Management** (`/waste`) - Eco-friendly waste management (Insta Trash)
- **Contact** (`/contact`) - Contact form and information
- **Booking** (`/booking`) - Multi-step interactive booking system

### Technology Stack

**Frontend:**
- Flutter Web
- Dart
- Go Router (navigation)
- Flutter Riverpod (state management)
- Flutter Animate (animations)
- Google Fonts (typography)
- Responsive Framework (responsive design)

**Design System:**
- Custom theme with primary (blue), secondary (green), and accent (gold) colors
- Poppins font family
- Modern card-based layout
- Smooth animations and transitions
- Professional color palette

## 📁 Project Structure

```
lib/
├── core/
│   ├── theme/
│   │   ├── app_colors.dart          # Color palette
│   │   └── app_theme.dart           # Theme data & typography
│   ├── models/
│   │   ├── service_model.dart       # Service data model
│   │   └── booking_model.dart       # Booking data model
│   ├── constants/
│   │   └── app_constants.dart       # App-wide constants
│   ├── providers/
│   │   └── providers.dart           # Riverpod state management
│   └── router/
│       └── app_router.dart          # Go Router configuration
│
├── features/
│   ├── home/
│   │   └── pages/home_page.dart     # Home page
│   ├── services/
│   │   └── pages/services_page.dart # Services listing
│   ├── auto_cleaning/
│   │   └── pages/auto_cleaning_page.dart
│   ├── laundry/
│   │   └── pages/laundry_page.dart
│   ├── waste/
│   │   └── pages/waste_page.dart
│   ├── contact/
│   │   └── pages/contact_page.dart
│   └── booking/
│       └── pages/booking_page.dart
│
├── shared/
│   └── widgets/
│       ├── app_header.dart          # Header & footer
│       └── service_card.dart        # Reusable cards
│
└── main.dart                        # Entry point
```

## 🎨 Design Features

### Advanced UI/UX
- **Animated Hero Sections** - Fade and slide-in animations
- **Interactive Cards** - Hover effects and smooth transitions
- **Responsive Grid Layouts** - Auto-adjusts to screen size
- **Multi-step Forms** - Booking process with validation
- **"Before/After" Sliders** - Auto Cleaning showcase
- **Subscription Plans** - Service tier comparisons
- **Category Filtering** - Dynamic service filtering
- **Process Timelines** - Step-by-step visualizations

### Color Scheme
- **Primary**: #0066CC (Professional Blue)
- **Secondary**: #00AA33 (Natural Green)
- **Accent**: #FFBB00 (Warm Gold)
- **Neutrals**: Gray scale from light to dark

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.11.4)
- Dart SDK (included with Flutter)
- A modern web browser

### Installation

1. **Clone the project and navigate to it:**
   ```bash
   cd ~/Projects/intawashuganda
   ```

2. **Get dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the web app:**
   ```bash
   flutter run -d chrome
   ```

   Or for deployment:
   ```bash
   flutter build web --release
   ```

## 📦 Key Dependencies

### UI & Animations
- `flutter_animate` - Advanced animations
- `animations` - Material animations
- `carousel_slider` - Image sliders
- `flutter_staggered_grid_view` - Staggered layouts

### Navigation & State
- `go_router` - Declarative routing
- `flutter_riverpod` - State management

### Styling & Fonts
- `google_fonts` - Premium fonts
- `responsive_framework` - Responsive breakpoints

### Firebase (when ready)
- `firebase_core`
- `cloud_firestore`
- `firebase_auth`

## 🔧 Responsive Breakpoints

```dart
Mobile:    < 800px
Tablet:    800px - 1200px
Desktop:   > 1200px
```

## 📝 Component Guidelines

### Theme Access
```dart
// Colors
AppColors.primary          // #0066CC
AppColors.secondary        // #00AA33
AppColors.white/darkGrey   // Neutrals

// Typography
Text(..., style: GoogleFonts.poppins(...))
```

### State Management (Riverpod)
```dart
// Reading state
final services = ref.watch(servicesProvider);

// Modifying state
ref.read(selectedServiceProvider.notifier).state = service;
```

### Navigation (Go Router)
```dart
context.go('/services');
context.go('/booking');
```

## 🎯 Next Steps & Enhancements

### Backend Integration
1. Firebase Firestore setup for bookings
2. Authentication system
3. Admin dashboard for managing services

### Advanced Features
1. Real-time booking confirmations
2. Email notifications
3. Payment integration (Stripe/Flutterwave)
4. User accounts and booking history
5. Push notifications

### SEO & Performance
1. Meta tags for Flutter Web
2. Image optimization
3. Code splitting
4. CDN deployment

### Mobile App
1. Flutter mobile app using same providers
2. Native mobile features
3. App store distribution

## 📞 Support

For questions or issues:
- Email: info@intawashuganda.ug
- Phone: +256 700 123456
- WhatsApp: +256 700 123456

## 📄 License

All rights reserved - Insta Wash Uganda
