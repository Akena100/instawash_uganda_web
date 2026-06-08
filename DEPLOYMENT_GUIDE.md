# Deployment Guide for SEO Setup

## Files Created for SEO

The following files have been created and configured for complete SEO setup:

### 1. **web/sitemap.xml** ✅
- Main sitemap containing all 18 pages
- Includes priority levels and change frequencies
- Submit to Google Search Console

### 2. **web/sitemap-services.xml** ✅
- Service-specific sitemap for individual service pages
- Supports dynamic service routing
- Reference in robots.txt

### 3. **web/robots.txt** ✅
- Crawler directives for search engines
- Includes sitemap references
- Blocks bad bots
- Sets crawl delays

### 4. **web/.htaccess** ✅
- Server-side configurations (for Apache hosting)
- Redirect HTTP to HTTPS
- Gzip compression
- Cache headers
- Security headers
- Directory listing protection

### 5. **firebase.json** ✅ (UPDATED)
- Firebase Hosting configuration
- Proper cache headers for all file types
- Security headers
- Rewrites configured for SPA

### 6. **web/index.html** ✅ (UPDATED)
- Comprehensive meta tags
- Open Graph tags
- Twitter Card tags
- JSON-LD structured data
- Canonical URL
- Sitemap reference

---

## Deployment Steps

### Step 1: Build the Flutter Web App
```bash
flutter clean
flutter pub get
flutter build web --release
```

### Step 2: Verify SEO Files Location
Ensure these files exist in the `build/web` directory after building:
- [ ] sitemap.xml
- [ ] sitemap-services.xml
- [ ] robots.txt
- [ ] .htaccess (only if using Apache)
- [ ] index.html (with updated meta tags)

### Step 3: Deploy to Firebase
```bash
firebase deploy --only hosting
```

### Step 4: Verify Deployment
1. Check that files are accessible:
   - https://intawashuganda.com/robots.txt
   - https://intawashuganda.com/sitemap.xml
   - https://intawashuganda.com/sitemap-services.xml

2. Check index.html has proper meta tags:
   - Open https://intawashuganda.com/
   - View page source (Ctrl+U or Cmd+U)
   - Verify meta tags are present

### Step 5: Update Flutter Build Process

Create `pubspec.yaml` post-build hook to copy SEO files:

Add to your build output process (in the build/web directory):
```bash
# After flutter build web
cp web/sitemap.xml build/web/
cp web/sitemap-services.xml build/web/
cp web/robots.txt build/web/
```

Or use a build script (Windows PowerShell):

Create `build-and-deploy.ps1`:
```powershell
# Clean and build
flutter clean
flutter pub get
flutter build web --release

# Copy SEO files
Copy-Item "web\sitemap.xml" -Destination "build\web\sitemap.xml"
Copy-Item "web\sitemap-services.xml" -Destination "build\web\sitemap-services.xml"
Copy-Item "web\robots.txt" -Destination "build\web\robots.txt"
Copy-Item "web\.htaccess" -Destination "build\web\.htaccess"

# Deploy
firebase deploy --only hosting
```

Run with:
```powershell
.\build-and-deploy.ps1
```

---

## Continuous Integration / Deployment

### GitHub Actions Example

Create `.github/workflows/deploy.yml`:

```yaml
name: Deploy to Firebase

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Flutter
      uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.x.x'
    
    - name: Build Flutter Web
      run: |
        flutter clean
        flutter pub get
        flutter build web --release
    
    - name: Copy SEO Files
      run: |
        cp web/sitemap.xml build/web/
        cp web/sitemap-services.xml build/web/
        cp web/robots.txt build/web/
        cp web/.htaccess build/web/
    
    - name: Deploy to Firebase
      uses: FirebaseExtended/action-hosting-deploy@v0
      with:
        repoToken: '${{ secrets.GITHUB_TOKEN }}'
        firebaseServiceAccount: '${{ secrets.FIREBASE_SERVICE_ACCOUNT }}'
        channelId: live
        projectId: instawash-uganda
```

---

## Post-Deployment Actions

### 1. Verify in Google Search Console
```
https://search.google.com/search-console
```
- [ ] Verify domain ownership
- [ ] Submit sitemap.xml
- [ ] Submit sitemap-services.xml
- [ ] Check coverage for indexing

### 2. Monitor Indexing
- Check Google Search Console for indexing status
- Request URL inspection for main pages
- Monitor for any errors or warnings

### 3. Test with Tools
- [ ] [Screaming Frog](https://www.screamingfrog.co.uk/seo-spider/) - Crawl your site
- [ ] [PageSpeed Insights](https://pagespeed.web.dev/) - Performance check
- [ ] [Mobile-Friendly Test](https://search.google.com/test/mobile-friendly) - Mobile optimization
- [ ] [Rich Results Test](https://search.google.com/test/rich-results) - Structured data validation

### 4. Set Up Analytics
```
Google Analytics 4 Setup:
1. Create GA4 property
2. Get Measurement ID
3. Update firebase config in index.html
4. Monitor traffic and conversions
```

---

## Important Notes

### Firebase Hosting Specific
- **Rewrites:** All traffic → index.html (SPA routing)
- **Headers:** Configured in firebase.json for caching
- **Static files:** Cached for 1 year (CSS, JS, images)
- **HTML:** Cached for 1 hour (allows updates)

### SEO Files Must Be in build/web/ After Build
These files are not automatically copied by Flutter. You need to:

**Option 1: Manual Copy Before Deployment**
```bash
flutter build web --release
cp web/sitemap.xml build/web/
cp web/sitemap-services.xml build/web/
cp web/robots.txt build/web/
cp web/.htaccess build/web/
firebase deploy --only hosting
```

**Option 2: Create a Deploy Script (Recommended)**
See build-and-deploy.ps1 example above

**Option 3: Create flutter hooks in pubspec.yaml**
Add a post-build hook to automatically copy files

---

## Troubleshooting

### Files Not Found on Website
**Problem:** Getting 404 errors for robots.txt or sitemap.xml

**Solution:**
1. Verify files are in `build/web/` directory
2. Run `flutter build web --release` again
3. Manually copy files before deploying
4. Check Firebase deployment status: `firebase deploy --only hosting`

### Meta Tags Not Showing
**Problem:** Meta tags not visible in page source

**Solution:**
1. Check index.html was updated correctly
2. Clear browser cache (Ctrl+Shift+Delete)
3. Use `curl` to check server response:
```bash
curl -I https://intawashuganda.com/
```

### Google Not Indexing Pages
**Problem:** Pages not appearing in Google search results

**Solution:**
1. Verify domain in Search Console
2. Submit sitemap
3. Request URL inspection for main pages
4. Check for robots.txt or meta robots blocking
5. Wait 2-4 weeks for initial indexing

---

## Monitoring Checklist

**Weekly:**
- [ ] Check Google Search Console for errors
- [ ] Monitor Search Console performance metrics
- [ ] Review any crawl errors

**Monthly:**
- [ ] Update sitemap.xml with new pages
- [ ] Check Analytics traffic trends
- [ ] Review top-performing pages
- [ ] Monitor page load speeds

**Quarterly:**
- [ ] Full site SEO audit
- [ ] Update meta tags if needed
- [ ] Review and update content
- [ ] Check for broken links

---

## Additional Resources

- [Firebase Hosting Documentation](https://firebase.google.com/docs/hosting)
- [Google Search Central](https://developers.google.com/search)
- [Google Search Console Help](https://support.google.com/webmasters)
- [Flutter Web SEO Best Practices](https://flutter.dev/docs/development/platform-integration/web#deploying-to-the-web)

---

*Last Updated: May 2, 2026*
*Deployment Status: Ready for Production*
