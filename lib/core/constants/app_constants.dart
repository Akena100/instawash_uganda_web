class AppConstants {
  // App Info
  static const String appName = 'Insta Wash Uganda';
  static const String appTagline = 'Your 360 Mobile Cleaning Partner';
  static const String appDescription =
      'Professional cleaning services for residential, commercial, industrial, and automotive needs';

  // Contact Info
  static const String email = 'instawashuganda@gmail.com';
  static const String phone = '+256 741 074 382';
  static const String address = 'Edna House level one, Plot 85A, Bukoto Kisasi Rd, Kampala';

  // Social Media
  static const String facebookUrl = 'https://facebook.com/intawash';
  static const String instagramUrl = 'https://instagram.com/intawash';
  static const String twitterUrl = 'https://twitter.com/intawash';
  static const String whatsappUrl = 'https://wa.me/256700123456';

  // Service Categories
  static const List<String> serviceCategories = [
    'Residential',
    'Commercial',
    'Industrial',
    'Auto Services',
    'Laundry',
    'Waste Management',
  ];

  // Features List
  static const List<String> features = [
    'Fast & Reliable',
    '24/7 Booking Support',
    'Trained Professionals',
    'Eco-Friendly Products',
    'Quality Guaranteed',
    'Competitive Pricing',
  ];

  // Testimonials
  static const List<Map<String, String>> testimonials = [
    {
      'name': 'John Kabira',
      'role': 'Business Owner',
      'text': 'Excellent service! The team was professional and thorough. Highly recommended!',
      'rating': '5',
    },
    {
      'name': 'Sarah Mwangi',
      'role': 'Homeowner',
      'text': 'Amazing attention to detail. My home has never looked cleaner!',
      'rating': '5',
    },
    {
      'name': 'Peter Ouma',
      'role': 'Factory Manager',
      'text': 'Reliable, efficient, and cost-effective. Perfect for our industrial cleaning needs.',
      'rating': '5',
    },
  ];

  // Stats
  static const Map<String, String> stats = {
    'Years': '5+',
    'Clients': '2000+',
    'Staff': '150+',
    'Projects': '10000+',
  };

  // Firebase Configuration
  static const String firebaseApiKey = "AIzaSyBZZJzsqxPD5C7Q2F62f5TYQhFBX5Zhpv4";
  static const String firebaseAuthDomain = "instawash-uganda.firebaseapp.com";
  static const String firebaseProjectId = "instawash-uganda";
  static const String firebaseStorageBucket = "instawash-uganda.firebasestorage.app";
  static const String firebaseMessagingSenderId = "820639614431";
  static const String firebaseAppId = "1:820639614431:web:57b0a3e8576767d08ab06a";
  static const String firebaseMeasurementId = "G-9PWJ92ZDVN";

  // Firebase Config Map (for direct access)
  static const Map<String, String> firebaseConfig = {
    'apiKey': firebaseApiKey,
    'authDomain': firebaseAuthDomain,
    'projectId': firebaseProjectId,
    'storageBucket': firebaseStorageBucket,
    'messagingSenderId': firebaseMessagingSenderId,
    'appId': firebaseAppId,
    'measurementId': firebaseMeasurementId,
  };
}
