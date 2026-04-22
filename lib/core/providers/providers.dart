import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intawashuganda/core/models/service_model.dart';
import 'package:intawashuganda/core/models/video_model.dart';
import 'package:intawashuganda/core/models/picture_model.dart';

// Theme mode provider
final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.dark;
});

// Mock services provider
final servicesProvider = Provider<List<Service>>((ref) {
  return [
    // ===== AUTO SERVICES =====
    // Car Exterior Cleaning
    Service(
      id: '1',
      name: 'Car Exterior Cleaning',
      description: 'Professional exterior car washing, polishing and restoration',
      category: 'Auto Services',
      icon: '🚗',
      imageUrl: 'assets/services/car exterior cleaning.jpg',
      price: 80000,
      rating: 4.8,
      reviews: 456,
      duration: '1-1.5 hours',
      features: ['Head Lamp Restoration', 'Body Scrub & Polishing', 'Pressure Wash', 'Radiator Cleaning', 'Rim Scrubbing'],
    ),
    // Car Interior Cleaning
    Service(
      id: '2',
      name: 'Car Interior Cleaning',
      description: 'Deep interior cleaning, leather care and seat scrubbing',
      category: 'Auto Services',
      icon: '🚙',
      imageUrl: 'assets/services/5978696413245803687.jpg',
      price: 95000,
      rating: 4.9,
      reviews: 523,
      duration: '1.5-2 hours',
      features: ['Leather Conditioning', 'Vacuuming & Dusting', 'Seat Scrubbing', 'Dashboard Cleaning', 'Window Polishing', 'Carpet Scrubbing', 'Pest Control'],
    ),

    // ===== RESIDENTIAL/HOME CARE =====
    Service(
      id: '3',
      name: 'Home Cleaning',
      description: 'Professional deep cleaning for residential homes',
      category: 'Residential',
      icon: '🏠',
      imageUrl: 'assets/services/cleaning team.jpg',
      price: 150000,
      rating: 4.8,
      reviews: 334,
      duration: '2-3 hours',
      features: ['Deep Clean', 'Eco-Friendly Products', 'Trained Staff'],
    ),
    Service(
      id: '4',
      name: 'Roof Cleaning',
      description: 'Professional roof maintenance and cleaning',
      category: 'Residential',
      icon: '🏡',
      imageUrl: 'assets/services/roof cleaning.jpg',
      price: 280000,
      rating: 4.7,
      reviews: 198,
      duration: '4-5 hours',
      features: ['Algae Removal', 'Pressure Washing', 'Inspection', 'Moss Treatment'],
    ),
    Service(
      id: '5',
      name: 'Paver Scrubbing',
      description: 'Professional paver and outdoor surface cleaning',
      category: 'Residential',
      icon: '⛏️',
      imageUrl: 'assets/services/pavers cleaning.jpg',
      price: 200000,
      rating: 4.6,
      reviews: 245,
      duration: '2-3 hours',
      features: ['Deep Scrub', 'Pressure Wash', 'Stain Removal', 'Sealing'],
    ),
    Service(
      id: '6',
      name: 'Gardening & Compound Maintenance',
      description: 'Professional garden landscaping and maintenance',
      category: 'Residential',
      icon: '🌿',
      imageUrl: 'assets/services/5978915293369142414.jpg',
      price: 220000,
      rating: 4.7,
      reviews: 267,
      duration: '2-4 hours',
      features: ['Lawn Mowing', 'Trimming', 'Weeding', 'Landscaping'],
    ),
    Service(
      id: '7',
      name: 'Water Tank Cleaning',
      description: 'Safe and thorough water tank cleaning and disinfection',
      category: 'Residential',
      icon: '💧',
      imageUrl: 'assets/services/water tank cleaning.jpg',
      price: 250000,
      rating: 4.9,
      reviews: 289,
      duration: '3-4 hours',
      features: ['Sanitization', 'Quality Check', 'Disinfection', 'Certification'],
    ),
    Service(
      id: '8',
      name: 'Sofa & Carpet Cleaning',
      description: 'Professional upholstery and carpet steam cleaning',
      category: 'Residential',
      icon: '🛋️',
      imageUrl: 'assets/services/carpet cleaning.jpg',
      price: 180000,
      rating: 4.8,
      reviews: 312,
      duration: '1.5-2.5 hours',
      features: ['Steam Cleaning', 'Stain Removal', 'Deodorizing', 'Fast Drying'],
    ),
    Service(
      id: '9',
      name: 'Instant Laundry Care',
      description: 'Quick and professional laundry service',
      category: 'Residential',
      icon: '👕',
      imageUrl: 'assets/services/laundry.jpg',
      price: 45000,
      rating: 4.6,
      reviews: 456,
      duration: '2-3 days',
      features: ['Gentle Care', 'Fast Service', 'Stain Removal', 'Ironing'],
    ),
    Service(
      id: '10',
      name: 'Tile Scrubbing & Restoration',
      description: 'Professional tile and grout cleaning',
      category: 'Residential',
      icon: '🧼',
      imageUrl: 'assets/services/tile cleaning.jpg',
      price: 160000,
      rating: 4.7,
      reviews: 223,
      duration: '2-3 hours',
      features: ['Grout Cleaning', 'Stain Removal', 'Sealing', 'Polishing'],
    ),
    Service(
      id: '11',
      name: 'Terrazzo Maintenance',
      description: 'Professional terrazzo floor scrubbing and maintenance',
      category: 'Residential',
      icon: '✨',
      imageUrl: 'assets/services/terrazo.jpg',
      price: 190000,
      rating: 4.8,
      reviews: 187,
      duration: '2-3 hours',
      features: ['Scrubbing', 'Polishing', 'Sealing', 'Restoration'],
    ),
    Service(
      id: '12',
      name: 'Shoe Cleaning & Repair',
      description: 'Professional shoe cleaning and repair services',
      category: 'Residential',
      icon: '👟',
      imageUrl: 'assets/services/5978696413245803690.jpg',
      price: 35000,
      rating: 4.6,
      reviews: 178,
      duration: '3-5 days',
      features: ['Deep Clean', 'Repair', 'Conditioning', 'Polishing'],
    ),
    Service(
      id: '13',
      name: 'Trench & Channel Cleaning',
      description: 'Drainage and water channel cleaning',
      category: 'Residential',
      icon: '🌊',
      imageUrl: 'assets/services/trench cleaning.jpg',
      price: 220000,
      rating: 4.7,
      reviews: 156,
      duration: '3-4 hours',
      features: ['Desilting', 'Pressure Wash', 'Disinfection'],
    ),

    // ===== COMMERCIAL/CORPORATE =====
    Service(
      id: '14',
      name: 'Office Cleaning',
      description: 'Complete office space cleaning and maintenance',
      category: 'Commercial',
      icon: '🏢',
      imageUrl: 'assets/services/5978696413245803688.jpg',
      price: 500000,
      rating: 4.8,
      reviews: 412,
      duration: 'Flexible',
      features: ['24/7 Support', 'Customizable', 'Professional Team', 'Eco-Friendly'],
    ),
    Service(
      id: '15',
      name: 'Banking & Financial Facilities',
      description: 'Specialized cleaning for banks and financial institutions',
      category: 'Commercial',
      icon: '🏦',
      imageUrl: 'assets/services/5978696413245803689.jpg',
      price: 600000,
      rating: 4.9,
      reviews: 234,
      duration: 'On Schedule',
      features: ['Marble Polishing', 'Lobby Cleaning', 'Vault Area', 'High Security'],
    ),
    Service(
      id: '16',
      name: 'Mall & Supermarket Cleaning',
      description: 'Large-scale commercial space cleaning',
      category: 'Commercial',
      icon: '🛒',
      imageUrl: 'assets/services/5978696413245803691.jpg',
      price: 750000,
      rating: 4.7,
      reviews: 289,
      duration: 'Nights/Weekends',
      features: ['Floor Polishing', 'Escalator Cleaning', 'Restroom Care', 'Waste Management'],
    ),

    // ===== EDUCATIONAL INSTITUTIONS =====
    Service(
      id: '17',
      name: 'School & University Cleaning',
      description: 'Complete educational facility cleaning services',
      category: 'Educational',
      icon: '🎓',
      imageUrl: 'assets/services/5978696413245803693.jpg',
      price: 400000,
      rating: 4.8,
      reviews: 323,
      duration: 'Evenings/Weekends',
      features: ['Classroom Cleaning', 'Laboratory Care', 'Sports Facilities', 'Hostel Cleaning', 'Safe Chemicals'],
    ),

    // ===== HEALTHCARE =====
    Service(
      id: '18',
      name: 'Hospital & Health Facilities',
      description: 'Sterile and specialized hospital cleaning',
      category: 'Healthcare',
      icon: '🏥',
      imageUrl: 'assets/services/5978696413245803694.jpg',
      price: 850000,
      rating: 4.9,
      reviews: 378,
      duration: 'On Schedule',
      features: ['ICU Cleaning', 'Operating Theatre', 'Sterilization', 'Medical Grade', 'Certified Staff'],
    ),

    // ===== HOSPITALITY =====
    Service(
      id: '19',
      name: 'Hotel & Resort Cleaning',
      description: 'Professional hospitality-grade cleaning services',
      category: 'Hospitality',
      icon: '🏨',
      imageUrl: 'assets/services/5978696413245803695.jpg',
      price: 600000,
      rating: 4.8,
      reviews: 356,
      duration: 'Flexible',
      features: ['Room Cleaning', 'Carpet Care', 'Upholstery', 'Gym Equipment', 'Laundry Room'],
    ),

    // ===== SPECIALIZED SERVICES =====
    Service(
      id: '20',
      name: 'Pre & Post Construction',
      description: 'Specialized cleaning after construction and renovation',
      category: 'Specialized',
      icon: '🏗️',
      imageUrl: 'assets/services/5978696413245803696.jpg',
      price: 500000,
      rating: 4.7,
      reviews: 267,
      duration: 'Variable',
      features: ['Debris Removal', 'Deep Clean', 'Polish Finishing', 'Quality Check'],
    ),
    Service(
      id: '21',
      name: 'Industrial & Factory Cleaning',
      description: 'Heavy-duty industrial facility cleaning',
      category: 'Industrial',
      icon: '🏭',
      imageUrl: 'assets/services/5978696413245803697.jpg',
      price: 800000,
      rating: 4.8,
      reviews: 234,
      duration: 'On Schedule',
      features: ['Degreasing', 'Warehouse Cleaning', 'Loading Dock', 'Equipment Cleaning'],
    ),
    Service(
      id: '22',
      name: 'Road & Street Cleaning',
      description: 'Municipal and infrastructure cleaning services',
      category: 'Infrastructure',
      icon: '🛣️',
      imageUrl: 'assets/services/road.jpg',
      price: 450000,
      rating: 4.6,
      reviews: 198,
      duration: 'Scheduled',
      features: ['Sweeping', 'Pressure Wash', 'Grass Cutting', 'Drainage Cleaning', 'Litter Collection'],
    ),
    Service(
      id: '23',
      name: 'Warehouse & Storage Cleaning',
      description: 'Large warehouse and storage facility cleaning',
      category: 'Infrastructure',
      icon: '📦',
      imageUrl: 'assets/services/5978915293369142411.jpg',
      price: 550000,
      rating: 4.7,
      reviews: 212,
      duration: 'On Schedule',
      features: ['Floor Degreasing', 'Rack Cleaning', 'Pest Control', 'Ventilation', 'High Reach'],
    ),
    Service(
      id: '24',
      name: 'Pre & Post Event Cleaning',
      description: 'Professional event venue cleaning services',
      category: 'Event',
      icon: '🎉',
      imageUrl: 'assets/services/5978915293369142413.jpg',
      price: 350000,
      rating: 4.9,
      reviews: 289,
      duration: 'Flexible',
      features: ['Setup Cleaning', 'Full Service', 'Post Event Cleanup', 'Fast Turnaround'],
    ),
  ];
});

// Selected service provider
final selectedServiceProvider = StateProvider<Service?>((ref) => null);

// Booking form provider
final bookingFormProvider = StateProvider<Map<String, dynamic>>((ref) {
  return {
    'name': '',
    'email': '',
    'phone': '',
    'location': '',
    'date': null,
    'time': '',
    'notes': '',
  };
});

// Loading provider
final loadingProvider = StateProvider<bool>((ref) => false);

// Filter provider
final serviceFilterProvider = StateProvider<String?>((ref) => null);

// Filtered services
final filteredServicesProvider = Provider<List<Service>>((ref) {
  final services = ref.watch(servicesProvider);
  final filter = ref.watch(serviceFilterProvider);

  if (filter == null || filter.isEmpty) {
    return services;
  }

  return services.where((service) => service.category == filter).toList();
});

// Mock videos provider
final videosProvider = Provider<List<Video>>((ref) {
  return [
    Video(
      id: 'v1',
      title: 'Professional Home Cleaning',
      description: 'Watch Insta Wash transform homes with expert cleaning techniques and eco-friendly products.',
      youtubeId: 'fXh0bQGIX9Q',
      category: 'Home Cleaning',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/fXh0bQGIX9Q/hqdefault.jpg',
      uploadedAt: DateTime(2024, 1, 15),
      featured: true,
    ),
    Video(
      id: 'v2',
      title: 'Professional Cleaning Services',
      description: 'Discover Insta Wash professional cleaning solutions for all your needs.',
      youtubeId: 'ztVesAsRQFU',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/ztVesAsRQFU/hqdefault.jpg',
      uploadedAt: DateTime(2024, 1, 10),
      featured: true,
    ),
    Video(
      id: 'v3',
      title: 'Expert Cleaning Team at Work',
      description: 'See our skilled team delivering outstanding cleaning results.',
      youtubeId: 'w_7kw86XJjY',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/w_7kw86XJjY/hqdefault.jpg',
      uploadedAt: DateTime(2024, 1, 5),
      featured: false,
    ),
    Video(
      id: 'v4',
      title: 'Quality Cleaning Standards',
      description: 'Insta Wash maintains the highest standards in every cleaning project.',
      youtubeId: 'pO7SSnzzamQ',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/pO7SSnzzamQ/hqdefault.jpg',
      uploadedAt: DateTime(2023, 12, 28),
      featured: false,
    ),
    Video(
      id: 'v5',
      title: 'Insta Wash Solutions',
      description: 'Complete cleaning solutions tailored to your needs.',
      youtubeId: '4a6pLaAKqAQ',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/4a6pLaAKqAQ/hqdefault.jpg',
      uploadedAt: DateTime(2023, 12, 20),
      featured: true,
    ),
    Video(
      id: 'v6',
      title: 'Professional Results',
      description: 'Experience the Insta Wash difference with professional cleaning results.',
      youtubeId: 'CfuZ_Qwi3Ms',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/CfuZ_Qwi3Ms/hqdefault.jpg',
      uploadedAt: DateTime(2023, 12, 15),
      featured: false,
    ),
    Video(
      id: 'v7',
      title: 'Our Cleaning Process',
      description: 'Learn about Insta Wash proven cleaning process and methodology.',
      youtubeId: 'wy73tBw_NsE',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/wy73tBw_NsE/hqdefault.jpg',
      uploadedAt: DateTime(2023, 12, 10),
      featured: false,
    ),
    Video(
      id: 'v8',
      title: 'Insta Wash Quality Assurance',
      description: 'See how Insta Wash ensures quality in every cleaning service.',
      youtubeId: 'pGajobpfALc',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/pGajobpfALc/hqdefault.jpg',
      uploadedAt: DateTime(2023, 12, 5),
      featured: false,
    ),
    Video(
      id: 'v9',
      title: 'Customer Testimonials',
      description: 'Hear from satisfied Insta Wash customers about their experience.',
      youtubeId: '94eoYw77srw',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/94eoYw77srw/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 28),
      featured: false,
    ),
    Video(
      id: 'v10',
      title: 'Insta Wash Quick Tips',
      description: 'Quick cleaning tips and tricks from the Insta Wash team.',
      youtubeId: 'p58f9AGdRQA',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/p58f9AGdRQA/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 20),
      featured: false,
    ),
    Video(
      id: 'v11',
      title: 'Insta Wash Short 1',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'EtJqNWNqhQs',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/EtJqNWNqhQs/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 18),
      featured: false,
    ),
    Video(
      id: 'v12',
      title: 'Insta Wash Short 2',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: '23Yb9clZGn8',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/23Yb9clZGn8/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 16),
      featured: false,
    ),
    Video(
      id: 'v13',
      title: 'Insta Wash Short 3',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'RaniUv01DVU',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/RaniUv01DVU/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 14),
      featured: false,
    ),
    Video(
      id: 'v14',
      title: 'Insta Wash Short 4',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: '2RWEqbdnNwc',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/2RWEqbdnNwc/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 12),
      featured: false,
    ),
    Video(
      id: 'v15',
      title: 'Insta Wash Short 5',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'k-_j_al5bKI',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/k-_j_al5bKI/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 10),
      featured: false,
    ),
    Video(
      id: 'v16',
      title: 'Insta Wash Short 6',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'tAuAavWOY2Q',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/tAuAavWOY2Q/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 08),
      featured: false,
    ),
    Video(
      id: 'v17',
      title: 'Insta Wash Short 7',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'rpRdS2xCTzk',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/rpRdS2xCTzk/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 06),
      featured: false,
    ),
    Video(
      id: 'v18',
      title: 'Insta Wash Short 8',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'eTy2WJqEBf0',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/eTy2WJqEBf0/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 04),
      featured: false,
    ),
    Video(
      id: 'v19',
      title: 'Insta Wash Short 9',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'rvljOl0Lo8c',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/rvljOl0Lo8c/hqdefault.jpg',
      uploadedAt: DateTime(2023, 11, 02),
      featured: false,
    ),
    Video(
      id: 'v20',
      title: 'Insta Wash Short 10',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: '4PmQJ6CudIc',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/4PmQJ6CudIc/hqdefault.jpg',
      uploadedAt: DateTime(2023, 10, 31),
      featured: false,
    ),
    Video(
      id: 'v21',
      title: 'Insta Wash Short 11',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'rb943tbHaZs',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/rb943tbHaZs/hqdefault.jpg',
      uploadedAt: DateTime(2023, 10, 29),
      featured: false,
    ),
    Video(
      id: 'v22',
      title: 'Insta Wash Short 12',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'hetMFSnUayQ',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/hetMFSnUayQ/hqdefault.jpg',
      uploadedAt: DateTime(2023, 10, 27),
      featured: false,
    ),
    Video(
      id: 'v23',
      title: 'Insta Wash Short 13',
      description: 'Quick cleaning highlight from Insta Wash.',
      youtubeId: 'jcGrgO3SCQE',
      category: 'Services',
      channel: 'Insta Wash',
      thumbnailUrl: 'https://img.youtube.com/vi/jcGrgO3SCQE/hqdefault.jpg',
      uploadedAt: DateTime(2023, 10, 25),
      featured: false,
    ),
  ];
});

// Featured videos provider
final featuredVideosProvider = Provider<List<Video>>((ref) {
  final videos = ref.watch(videosProvider);
  return videos.where((video) => video.featured).toList();
});

// Videos by category provider
final videosByCategoryProvider = Provider.family<List<Video>, String>((ref, category) {
  final videos = ref.watch(videosProvider);
  return videos.where((video) => video.category == category).toList();
});

// Get unique video categories
final videoCategoriesProvider = Provider<List<String>>((ref) {
  final videos = ref.watch(videosProvider);
  final categories = <String>{};
  for (var video in videos) {
    categories.add(video.category);
  }
  return categories.toList()..sort();
});

// Get unique video channels
final videoChannelsProvider = Provider<List<String>>((ref) {
  final videos = ref.watch(videosProvider);
  final channels = <String>{};
  for (var video in videos) {
    channels.add(video.channel);
  }
  return channels.toList()..sort();
});

// Videos by channel provider
final videosByChannelProvider = Provider.family<List<Video>, String>((ref, channel) {
  final videos = ref.watch(videosProvider);
  return videos.where((video) => video.channel == channel).toList();
});

// Mock pictures provider
final picturesProvider = Provider<List<Picture>>((ref) {
  return [
    // Named images
    Picture(
      id: 'p1',
      title: 'Professional Cleaning Team',
      description: 'Our expert Insta Wash cleaning team at work',
      imagePath: 'assets/services/cleaning team.jpg',
    ),
    Picture(
      id: 'p2',
      title: 'Car Exterior Cleaning',
      description: 'Professional car exterior cleaning and polishing',
      imagePath: 'assets/services/car exterior cleaning.jpg',
    ),
    Picture(
      id: 'p3',
      title: 'Laundry Services',
      description: 'Premium laundry and garment care',
      imagePath: 'assets/services/laundry.jpg',
    ),
    Picture(
      id: 'p4',
      title: 'Outdoor Cleaning',
      description: 'Professional outdoor space cleaning',
      imagePath: 'assets/services/outdoor cleaning.jpg',
    ),
    Picture(
      id: 'p5',
      title: 'Pavers Cleaning',
      description: 'Expert paver and hardscape cleaning',
      imagePath: 'assets/services/pavers cleaning.jpg',
    ),
    Picture(
      id: 'p6',
      title: 'Pest Control',
      description: 'Professional pest control services',
      imagePath: 'assets/services/pest control.jpg',
    ),
    Picture(
      id: 'p7',
      title: 'Pests Cleaning',
      description: 'Safe and effective pest removal',
      imagePath: 'assets/services/pests cleaning.jpg',
    ),
    Picture(
      id: 'p8',
      title: 'Road Cleaning',
      description: 'Large-scale road and street cleaning',
      imagePath: 'assets/services/road cleaning.jpg',
    ),
    Picture(
      id: 'p9',
      title: 'Roof Cleaning',
      description: 'Professional roof cleaning and maintenance',
      imagePath: 'assets/services/roof cleaning.jpg',
    ),
    // Numbered images
    Picture(
      id: 'p10',
      title: 'Service Portfolio 1',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803687.jpg',
    ),
    Picture(
      id: 'p11',
      title: 'Service Portfolio 2',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803688.jpg',
    ),
    Picture(
      id: 'p12',
      title: 'Service Portfolio 3',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803689.jpg',
    ),
    Picture(
      id: 'p13',
      title: 'Service Portfolio 4',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803690.jpg',
    ),
    Picture(
      id: 'p14',
      title: 'Service Portfolio 5',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803691.jpg',
    ),
    Picture(
      id: 'p15',
      title: 'Service Portfolio 6',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803692.jpg',
    ),
    Picture(
      id: 'p16',
      title: 'Service Portfolio 7',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803693.jpg',
    ),
    Picture(
      id: 'p17',
      title: 'Service Portfolio 8',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803694.jpg',
    ),
    Picture(
      id: 'p18',
      title: 'Service Portfolio 9',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803695.jpg',
    ),
    Picture(
      id: 'p19',
      title: 'Service Portfolio 10',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803696.jpg',
    ),
    Picture(
      id: 'p20',
      title: 'Service Portfolio 11',
      description: 'Insta Wash service showcase',
      imagePath: 'assets/services/5978696413245803697.jpg',
    ),
  ];
});
