# SEO Meta Tags Template for Each Page

Use these templates when updating meta tags for individual pages. Update the `description` and `keywords` for each page.

## Home Page (Already Optimized)
```html
<title>Insta Wash Uganda - Professional 360 Mobile Cleaning Services | Car Wash, Home Cleaning & Laundry</title>
<meta name="description" content="Your trusted 360 mobile cleaning partner in Kampala, Uganda. Professional car washing, home cleaning, laundry, and commercial services.">
<meta name="keywords" content="cleaning services Uganda, car wash, home cleaning, laundry, Kampala cleaning">
```

## Services Page
```html
<title>Our Services | Insta Wash Uganda - Professional Cleaning Solutions</title>
<meta name="description" content="Explore our comprehensive cleaning services including car exterior cleaning, home cleaning, laundry, pest control, and commercial cleaning services.">
<meta name="keywords" content="cleaning services, professional cleaning, car wash, home cleaning, laundry, pest control, commercial cleaning">
```

## About Us Page
```html
<title>About Insta Wash Uganda - Professional Cleaning Company</title>
<meta name="description" content="Learn about Insta Wash Uganda - your trusted cleaning partner since [YEAR]. We provide professional, reliable, and affordable cleaning services across Kampala.">
<meta name="keywords" content="about cleaning company, professional cleaners, cleaning service provider, Kampala cleaning company">
```

## Contact Us Page
```html
<title>Contact Insta Wash Uganda - Get Your Free Quote Today</title>
<meta name="description" content="Get in touch with Insta Wash Uganda. Contact us for professional cleaning services, quotes, and more. We're available 24/7 in Kampala.">
<meta name="keywords" content="contact cleaning services, cleaning company contact, Kampala cleaning contact, get cleaning quote">
```

## Auto Cleaning Page
```html
<title>Professional Car Washing & Auto Cleaning Services | Insta Wash Uganda</title>
<meta name="description" content="Professional car exterior cleaning, polishing, and restoration services. We use eco-friendly products and provide attention to detail for your vehicle.">
<meta name="keywords" content="car wash, professional car washing, car cleaning service, auto detailing, car polishing Kampala">
```

## Laundry Page
```html
<title>Premium Laundry & Garment Care Services | Insta Wash Uganda</title>
<meta name="description" content="Professional laundry and garment care services. We handle delicate fabrics with expert care. Fast turnaround and affordable pricing in Kampala.">
<meta name="keywords" content="laundry service, professional laundry, garment cleaning, delicate fabric care, dry cleaning Kampala">
```

## Home Cleaning Page
```html
<title>Professional Home Cleaning Services | Insta Wash Uganda</title>
<meta name="description" content="Deep cleaning services for your residential home. Eco-friendly products, trained staff, and attention to detail. Book your home cleaning today.">
<meta name="keywords" content="home cleaning, house cleaning service, deep cleaning, residential cleaning, home cleaners Kampala">
```

## Gallery Page
```html
<title>Gallery | Insta Wash Uganda - Our Work & Portfolio</title>
<meta name="description" content="View our portfolio of cleaning projects and places we've served. See the quality of our work and the satisfaction of our customers.">
<meta name="keywords" content="cleaning portfolio, cleaning gallery, before and after, cleaning projects, customer work">
```

## FAQ Page
```html
<title>FAQ | Insta Wash Uganda - Common Questions Answered</title>
<meta name="description" content="Frequently asked questions about our cleaning services, pricing, scheduling, and more. Get answers to your cleaning service questions.">
<meta name="keywords" content="cleaning FAQ, cleaning questions, service information, cleaning tips, cleaning help">
```

## Projects Page
```html
<title>Projects | Insta Wash Uganda - Commercial & Large Scale Cleaning</title>
<meta name="description" content="Browse our large-scale commercial cleaning projects and successful client stories. See how we handle complex cleaning requirements.">
<meta name="keywords" content="commercial cleaning projects, large scale cleaning, cleaning portfolio, successful projects">
```

---

## Open Graph Tags for Social Sharing

Update these for each page:

```html
<!-- For Home Page -->
<meta property="og:title" content="Insta Wash Uganda - Professional 360 Mobile Cleaning Services">
<meta property="og:description" content="Your trusted cleaning partner for cars, homes, laundry, and more across Kampala, Uganda.">
<meta property="og:image" content="https://intawashuganda.com/og-home-image.jpg">

<!-- For Services Page -->
<meta property="og:title" content="Our Services | Insta Wash Uganda">
<meta property="og:description" content="Explore comprehensive cleaning services from professional car wash to home and commercial cleaning.">
<meta property="og:image" content="https://intawashuganda.com/og-services-image.jpg">
```

---

## JSON-LD Structured Data for Pages

### For Service Pages
```json
{
  "@context": "https://schema.org",
  "@type": "Service",
  "name": "Car Exterior Cleaning",
  "description": "Professional car exterior cleaning with attention to detail",
  "provider": {
    "@type": "LocalBusiness",
    "name": "Insta Wash Uganda",
    "url": "https://intawashuganda.com"
  },
  "areaServed": "Kampala",
  "priceRange": "UGX 80,000 - 200,000"
}
```

### For Contact Page
```json
{
  "@context": "https://schema.org",
  "@type": "ContactPage",
  "mainEntity": {
    "@type": "LocalBusiness",
    "name": "Insta Wash Uganda",
    "url": "https://intawashuganda.com",
    "telephone": "+256-xxx-xxx-xxx",
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "Kampala",
      "addressCountry": "UG"
    }
  }
}
```

### For About Page
```json
{
  "@context": "https://schema.org",
  "@type": "AboutPage",
  "mainEntity": {
    "@type": "LocalBusiness",
    "name": "Insta Wash Uganda",
    "description": "Professional 360 mobile cleaning services in Kampala, Uganda",
    "url": "https://intawashuganda.com",
    "image": "https://intawashuganda.com/logo.png",
    "foundingDate": "YYYY",
    "areaServed": "Kampala"
  }
}
```

---

## How to Update Pages in Flutter

For each page route, add route-specific metadata using a Meta package or update the HTML dynamically.

### Using Flutter Meta Package (Recommended)

Add to pubspec.yaml:
```yaml
dependencies:
  meta_seo: ^1.0.0
```

Then in each page:
```dart
class ServicesPage extends ConsumerStatefulWidget {
  const ServicesPage({super.key});

  @override
  ConsumerState<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends ConsumerState<ServicesPage> {
  @override
  void initState() {
    super.initState();
    updatePageMetaTags(
      title: "Our Services | Insta Wash Uganda",
      description: "Comprehensive cleaning services...",
      keywords: "cleaning services, car wash...",
    );
  }

  @override
  Widget build(BuildContext context) {
    // Page content
  }
}

void updatePageMetaTags({
  required String title,
  required String description,
  required String keywords,
}) {
  // Update meta tags in the DOM
  document.title = title;
  // Update meta description, keywords, etc.
}
```

---

## Important Reminders

1. **Keep meta descriptions between 140-160 characters**
2. **Keep titles between 50-60 characters for desktop viewing**
3. **Use targeted keywords naturally - no keyword stuffing**
4. **Each page should have unique meta tags**
5. **Update open graph images to match each page content**
6. **Test social sharing on Facebook & Twitter**

---

## Testing & Validation

### Tools to Use:
1. **Meta Tags Validator:** https://www.metatags.io/
2. **Open Graph Preview:** https://ogp.me/
3. **Structured Data Test:** https://search.google.com/test/rich-results
4. **Mobile-Friendly Test:** https://search.google.com/test/mobile-friendly

---

*Last Updated: May 2, 2026*
