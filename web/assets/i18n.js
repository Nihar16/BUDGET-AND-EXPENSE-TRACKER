(function () {
  const SUPPORTED = ["en", "de", "zh", "hi"];
  const FALLBACK = "en";
  const STORAGE_KEY = "app_lang";
  const PROMPT_SEEN_KEY = "app_lang_prompt_seen";
  const LANGUAGE_LABELS = {
    en: "English",
    de: "Deutsch",
    zh: "Chinese",
    hi: "Hindi"
  };

  function normalizeLang(lang) {
    if (!lang) return null;
    const base = String(lang).toLowerCase().split("-")[0];
    return SUPPORTED.includes(base) ? base : null;
  }

  function detectPreferredLang() {
    const saved = normalizeLang(localStorage.getItem(STORAGE_KEY));
    if (saved) return saved;

    const urlLang = normalizeLang(new URLSearchParams(window.location.search).get("lang"));
    if (urlLang) return urlLang;

    const browserLangs = Array.isArray(navigator.languages) && navigator.languages.length
      ? navigator.languages
      : [navigator.language];

    for (const lang of browserLangs) {
      const normalized = normalizeLang(lang);
      if (normalized) return normalized;
    }

    return FALLBACK;
  }

  function hasSavedPreference() {
    return !!normalizeLang(localStorage.getItem(STORAGE_KEY));
  }

  function currentPathLocale() {
    const first = window.location.pathname.split("/").filter(Boolean)[0];
    return normalizeLang(first);
  }

  function samePagePathWithoutLocale() {
    const parts = window.location.pathname.split("/").filter(Boolean);
    if (parts.length && normalizeLang(parts[0])) {
      parts.shift();
    }
    return parts.join("/");
  }

  function goToLocale(locale) {
    const page = samePagePathWithoutLocale();
    const next = page ? "/" + locale + "/" + page : "/" + locale + "/";
    window.location.href = next;
  }

  function initLanguageSwitcher() {
    const switcher = document.getElementById("langSwitcher");
    if (!switcher) return;

    const active = currentPathLocale() || detectPreferredLang();
    switcher.value = active;

    switcher.addEventListener("change", function (event) {
      const next = normalizeLang(event.target.value) || FALLBACK;
      localStorage.setItem(STORAGE_KEY, next);
      goToLocale(next);
    });

    maybeShowLanguagePrompt();
  }

  function maybeShowLanguagePrompt() {
    const alreadyPrompted = localStorage.getItem(PROMPT_SEEN_KEY) === "1";
    if (alreadyPrompted || hasSavedPreference()) return;

    const preferred = detectPreferredLang();
    const active = currentPathLocale() || preferred;
    const suggestedLabel = LANGUAGE_LABELS[preferred] || preferred.toUpperCase();

    const backdrop = document.createElement("div");
    backdrop.style.cssText = [
      "position:fixed",
      "inset:0",
      "background:rgba(0,0,0,0.5)",
      "display:flex",
      "align-items:center",
      "justify-content:center",
      "z-index:9999",
      "font-family:Arial,sans-serif"
    ].join(";");

    const modal = document.createElement("div");
    modal.style.cssText = [
      "background:#fff",
      "color:#111",
      "padding:1rem",
      "border-radius:8px",
      "width:min(92vw,420px)",
      "box-shadow:0 8px 30px rgba(0,0,0,0.2)"
    ].join(";");

    const heading = document.createElement("h3");
    heading.textContent = "Choose your language";
    heading.style.cssText = "margin:0 0 0.5rem;font-size:1.1rem;";

    const text = document.createElement("p");
    text.textContent = "Detected language: " + suggestedLabel + ". You can keep it or switch now.";
    text.style.cssText = "margin:0 0 0.75rem;font-size:0.95rem;line-height:1.4;";

    const select = document.createElement("select");
    select.setAttribute("aria-label", "Preferred language");
    select.style.cssText = "width:100%;padding:0.5rem;margin-bottom:0.75rem;";
    SUPPORTED.forEach(function (lang) {
      const option = document.createElement("option");
      option.value = lang;
      option.textContent = LANGUAGE_LABELS[lang] || lang.toUpperCase();
      if (lang === active) option.selected = true;
      select.appendChild(option);
    });

    const actions = document.createElement("div");
    actions.style.cssText = "display:flex;gap:0.5rem;justify-content:flex-end;";

    const keepBtn = document.createElement("button");
    keepBtn.type = "button";
    keepBtn.textContent = "Keep current";
    keepBtn.style.cssText = "padding:0.45rem 0.7rem;cursor:pointer;";

    const applyBtn = document.createElement("button");
    applyBtn.type = "button";
    applyBtn.textContent = "Apply language";
    applyBtn.style.cssText = "padding:0.45rem 0.7rem;cursor:pointer;";

    function closePrompt() {
      localStorage.setItem(PROMPT_SEEN_KEY, "1");
      if (backdrop.parentNode) backdrop.parentNode.removeChild(backdrop);
    }

    keepBtn.addEventListener("click", function () {
      const keep = normalizeLang(select.value) || active;
      localStorage.setItem(STORAGE_KEY, keep);
      closePrompt();
      if (keep !== active) {
        goToLocale(keep);
      }
    });

    applyBtn.addEventListener("click", function () {
      const next = normalizeLang(select.value) || active;
      localStorage.setItem(STORAGE_KEY, next);
      closePrompt();
      if (next !== active) {
        goToLocale(next);
      }
    });

    actions.appendChild(keepBtn);
    actions.appendChild(applyBtn);
    modal.appendChild(heading);
    modal.appendChild(text);
    modal.appendChild(select);
    modal.appendChild(actions);
    backdrop.appendChild(modal);
    document.body.appendChild(backdrop);
  }

  function maybeRedirectFromRoot() {
    const path = window.location.pathname.replace(/\/+$/, "");
    if (path === "") {
      const preferred = detectPreferredLang();
      window.location.replace("/" + preferred + "/");
    }
  }

  window.ZpendrI18n = {
    detectPreferredLang,
    initLanguageSwitcher,
    maybeRedirectFromRoot,
    normalizeLang
  };
})();