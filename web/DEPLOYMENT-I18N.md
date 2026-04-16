# i18n Deployment Notes

1) Replace every `__SITE_URL__` in HTML, `robots.txt`, and `sitemap.xml` with your final domain.
2) Keep locale paths as `/en/`, `/de/`, `/zh/`, `/hi/`.
3) Root `/` should remain the language router page.
4) If using Netlify, `_redirects` is already ready.
5) If using Vercel, `vercel.json` is already ready.
6) If using Cloudflare Pages, no extra routing file is needed for this setup.