# 🎯 SEO Pre-Launch Checklist

## Before You Deploy - Use This Checklist

### ✅ Files Verification
- [ ] `web/sitemap.xml` exists
- [ ] `web/sitemap-services.xml` exists
- [ ] `web/robots.txt` exists
- [ ] `web/.htaccess` exists
- [ ] `web/index.html` has been updated with meta tags
- [ ] `firebase.json` has been updated with headers

### ✅ Meta Tags Check
- [ ] Title tag is compelling (50-60 chars)
- [ ] Meta description present (140-160 chars)
- [ ] Keywords meta tag present
- [ ] Canonical URL set
- [ ] Viewport meta tag present
- [ ] Open Graph tags present
- [ ] Twitter Card tags present
- [ ] JSON-LD structured data present

### ✅ Build Process
- [ ] Run: `flutter clean`
- [ ] Run: `flutter pub get`
- [ ] Run: `flutter build web --release`
- [ ] Verify `build/web/` directory created
- [ ] Copy SEO files to `build/web/`:
  ```
  cp web/sitemap.xml build/web/
  cp web/sitemap-services.xml build/web/
  cp web/robots.txt build/web/
  cp web/.htaccess build/web/
  ```

### ✅ Pre-Deploy Testing
- [ ] Verify `build/web/index.html` has meta tags
- [ ] Check `build/web/sitemap.xml` is valid
- [ ] Check `build/web/robots.txt` is valid
- [ ] Verify all files are readable

### ✅ Firebase Deployment
- [ ] Run: `firebase deploy --only hosting`
- [ ] Wait for deployment completion
- [ ] Check deployment status in Firebase Console

### ✅ Post-Deploy Verification
- [ ] https://intawashuganda.com/ loads
- [ ] https://intawashuganda.com/robots.txt returns content
- [ ] https://intawashuganda.com/sitemap.xml returns XML
- [ ] https://intawashuganda.com/sitemap-services.xml returns XML
- [ ] View page source (Ctrl+U) - meta tags visible
- [ ] Open Graph tags work (test on [ogp.me](https://ogp.me/))

### ✅ Google Search Console Setup
- [ ] Go to https://search.google.com/search-console
- [ ] Click "Add property"
- [ ] Enter: `intawashuganda.com`
- [ ] Verify domain ownership (choose method)
- [ ] Wait for verification completion
- [ ] Submit sitemap.xml
- [ ] Submit sitemap-services.xml
- [ ] Request URL inspection for:
  - `intawashuganda.com/`
  - `intawashuganda.com/services`
  - `intawashuganda.com/about`
  - `intawashuganda.com/contact`

### ✅ Google Analytics Setup
- [ ] Create GA4 property
- [ ] Get Measurement ID
- [ ] Update Firebase config with GA ID
- [ ] Test analytics tracking

### ✅ Page Testing
Test each main page:
- [ ] Home page loads
- [ ] Services page loads
- [ ] About page loads
- [ ] Contact page loads
- [ ] Gallery page loads
- [ ] Mobile responsive
- [ ] All links work
- [ ] Images load properly

### ✅ Search Engine Testing
- [ ] Test with [Schema.org validator](https://schema.org/docs/tools.html)
- [ ] Test with [Google Rich Results Test](https://search.google.com/test/rich-results)
- [ ] Test with [Mobile-Friendly Test](https://search.google.com/test/mobile-friendly)
- [ ] Test with [PageSpeed Insights](https://pagespeed.web.dev/)

### ✅ Validation Tools
- [ ] Validate robots.txt at [robotstester.com](https://www.robotstester.com/)
- [ ] Validate sitemap at [XML Sitemaps](https://www.xml-sitemaps.com/)
- [ ] Check meta tags at [metatags.io](https://metatags.io/)
- [ ] Test social sharing at [ogp.me](https://ogp.me/)

### ✅ Social Media Setup
- [ ] Test Facebook sharing with OG tags
- [ ] Test Twitter sharing with Twitter tags
- [ ] Create Google My Business profile
- [ ] Add local business information
- [ ] Set service areas to Kampala
- [ ] Add business hours

---

## Deployment Command Reference

```bash
# Build Flutter web app
flutter clean
flutter pub get
flutter build web --release

# Copy SEO files (Windows PowerShell)
Copy-Item "web\sitemap.xml" -Destination "build\web\sitemap.xml"
Copy-Item "web\sitemap-services.xml" -Destination "build\web\sitemap-services.xml"
Copy-Item "web\robots.txt" -Destination "build\web\robots.txt"
Copy-Item "web\.htaccess" -Destination "build\web\.htaccess"

# Or copy (macOS/Linux)
cp web/sitemap.xml build/web/
cp web/sitemap-services.xml build/web/
cp web/robots.txt build/web/
cp web/.htaccess build/web/

# Deploy to Firebase
firebase deploy --only hosting

# View deployment status
firebase hosting:channel:list
```

---

## Expected Timelines

| Action | Timeframe |
|--------|-----------|
| Domain verification | 5-30 minutes |
| Sitemap submission | 1-2 hours |
| First crawl by Googlebot | 24 hours |
| Initial indexing | 2-7 days |
| Results in search | 2-4 weeks |
| Full site indexed | 1-2 months |
| Ranking improvements | 2-6 months |

---

## Common Issues & Solutions

### Issue: Robots.txt not found
**Solution:** Ensure file is in `build/web/` before deploying

### Issue: Meta tags not showing
**Solution:** Clear cache, hard refresh (Ctrl+Shift+R), check page source

### Issue: Sitemap won't submit
**Solution:** Validate XML syntax, check robots.txt references it, wait 24h

### Issue: Pages not indexed
**Solution:** Submit in Search Console, check for meta robots noindex, wait 2-4 weeks

### Issue: Mobile-friendly test fails
**Solution:** Check viewport meta tag, test with Flutter web responsive design

---

## Weekly Monitoring Tasks

- [ ] Check Google Search Console for errors
- [ ] Monitor impression and click counts
- [ ] Review top performing pages
- [ ] Check for crawl errors
- [ ] Verify no indexing issues
- [ ] Monitor site speed

---

## Monthly Tasks

- [ ] Update sitemaps with new pages
- [ ] Review Analytics traffic
- [ ] Check for ranking changes
- [ ] Update meta tags for top pages
- [ ] Audit for broken links
- [ ] Test mobile experience

---

## Quarterly Tasks

- [ ] Full SEO audit
- [ ] Review keyword performance
- [ ] Analyze backlink profile
- [ ] Update content as needed
- [ ] Review Core Web Vitals
- [ ] Check competitor rankings

---

## Document Reference

All implementation details are in:

| Document | Purpose |
|----------|---------|
| SEO_SETUP_GUIDE.md | Complete SEO setup instructions |
| META_TAGS_TEMPLATE.md | Meta tag templates for each page |
| DEPLOYMENT_GUIDE.md | Deployment and CI/CD setup |
| SEO_IMPLEMENTATION_COMPLETE.md | Full implementation summary |
| This file (checklist) | Quick reference for deployment |

---

## Quick Start After Deployment

```
1. Wait 1 hour after deployment
2. Open https://intawashuganda.com/sitemap.xml
3. If visible, go to Google Search Console
4. Verify domain ownership
5. Submit sitemaps
6. Monitor Search Console daily for first week
7. After 1-2 weeks, check "Performance" for impressions
```

---

## Support Resources

- Google Search Central: https://developers.google.com/search
- Firebase Documentation: https://firebase.google.com/docs
- Schema.org: https://schema.org
- SEO Starter Guide: https://developers.google.com/search/docs/beginner/seo-starter-guide

---

**Status: Ready for Production Deployment** ✅

*Use this checklist before deploying to production. Check off each item to ensure complete SEO setup.*

---
*Last Updated: May 2, 2026*
