import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const ZpendrApp());
}

class ZpendrApp extends StatefulWidget {
  const ZpendrApp({super.key});

  @override
  State<ZpendrApp> createState() => _ZpendrAppState();
}

class _ZpendrAppState extends State<ZpendrApp> {
  Locale? _selectedLocale;

  void _handleLocaleChanged(Locale? locale) {
    setState(() {
      _selectedLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zpendr',
      debugShowCheckedModeBanner: false,
      locale: _selectedLocale,
      supportedLocales: AppTranslations.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return AppTranslations.defaultLocale;
        }

        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }

        return AppTranslations.defaultLocale;
      },
      home: HomeScreen(
        selectedLocale: _selectedLocale,
        onLocaleChanged: _handleLocaleChanged,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.selectedLocale,
    required this.onLocaleChanged,
  });

  final Locale? selectedLocale;
  final ValueChanged<Locale?> onLocaleChanged;

  @override
  Widget build(BuildContext context) {
    final locale = selectedLocale ?? Localizations.localeOf(context);
    final strings = AppTranslations.of(locale);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.appTitle),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Card(
            margin: const EdgeInsets.all(24),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    strings.languageTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Text(strings.languageDescription),
                  const SizedBox(height: 16),
                  DropdownButtonFormField<Locale?>(
                    value: selectedLocale,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: strings.languageDropdownLabel,
                    ),
                    items: [
                      DropdownMenuItem<Locale?>(
                        value: null,
                        child: Text(strings.useSystemLanguage),
                      ),
                      ...AppTranslations.supportedLocales.map(
                        (locale) => DropdownMenuItem<Locale?>(
                          value: locale,
                          child: Text(AppTranslations.languageName(locale)),
                        ),
                      ),
                    ],
                    onChanged: onLocaleChanged,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    selectedLocale == null
                        ? strings.currentLanguageSystem(
                            AppTranslations.languageName(locale),
                          )
                        : strings.currentLanguageManual(
                            AppTranslations.languageName(locale),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppTranslations {
  static const Locale defaultLocale = Locale('en');

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('de'),
    Locale('hi'),
  ];

  static final Map<String, _Strings> _localizedValues = {
    'en': const _Strings(
      appTitle: 'Zpendr',
      languageTitle: 'Language',
      languageDescription:
          'We detect your system language automatically. You can switch languages anytime.',
      languageDropdownLabel: 'Choose language',
      useSystemLanguage: 'Use system language',
      currentLanguageSystemTemplate: 'Current language (system): {language}',
      currentLanguageManualTemplate: 'Current language (manual): {language}',
    ),
    'es': const _Strings(
      appTitle: 'Zpendr',
      languageTitle: 'Idioma',
      languageDescription:
          'Detectamos automáticamente el idioma del sistema. Puedes cambiarlo cuando quieras.',
      languageDropdownLabel: 'Elegir idioma',
      useSystemLanguage: 'Usar idioma del sistema',
      currentLanguageSystemTemplate: 'Idioma actual (sistema): {language}',
      currentLanguageManualTemplate: 'Idioma actual (manual): {language}',
    ),
    'fr': const _Strings(
      appTitle: 'Zpendr',
      languageTitle: 'Langue',
      languageDescription:
          'Nous détectons automatiquement la langue du système. Vous pouvez la modifier à tout moment.',
      languageDropdownLabel: 'Choisir la langue',
      useSystemLanguage: 'Utiliser la langue du système',
      currentLanguageSystemTemplate: 'Langue actuelle (système) : {language}',
      currentLanguageManualTemplate: 'Langue actuelle (manuelle) : {language}',
    ),
    'de': const _Strings(
      appTitle: 'Zpendr',
      languageTitle: 'Sprache',
      languageDescription:
          'Wir erkennen Ihre Systemsprache automatisch. Sie können die Sprache jederzeit ändern.',
      languageDropdownLabel: 'Sprache auswählen',
      useSystemLanguage: 'Systemsprache verwenden',
      currentLanguageSystemTemplate: 'Aktuelle Sprache (System): {language}',
      currentLanguageManualTemplate: 'Aktuelle Sprache (manuell): {language}',
    ),
    'hi': const _Strings(
      appTitle: 'Zpendr',
      languageTitle: 'भाषा',
      languageDescription:
          'हम आपके सिस्टम की भाषा अपने-आप पहचानते हैं। आप कभी भी भाषा बदल सकते हैं।',
      languageDropdownLabel: 'भाषा चुनें',
      useSystemLanguage: 'सिस्टम भाषा का उपयोग करें',
      currentLanguageSystemTemplate: 'वर्तमान भाषा (सिस्टम): {language}',
      currentLanguageManualTemplate: 'वर्तमान भाषा (मैनुअल): {language}',
    ),
  };

  static _Strings of(Locale locale) {
    return _localizedValues[locale.languageCode] ??
        _localizedValues[defaultLocale.languageCode]!;
  }

  static String languageName(Locale locale) {
    switch (locale.languageCode) {
      case 'es':
        return 'Español';
      case 'fr':
        return 'Français';
      case 'de':
        return 'Deutsch';
      case 'hi':
        return 'हिन्दी';
      default:
        return 'English';
    }
  }
}

class _Strings {
  const _Strings({
    required this.appTitle,
    required this.languageTitle,
    required this.languageDescription,
    required this.languageDropdownLabel,
    required this.useSystemLanguage,
    required this.currentLanguageSystemTemplate,
    required this.currentLanguageManualTemplate,
  });

  final String appTitle;
  final String languageTitle;
  final String languageDescription;
  final String languageDropdownLabel;
  final String useSystemLanguage;
  final String currentLanguageSystemTemplate;
  final String currentLanguageManualTemplate;

  String currentLanguageSystem(String language) {
    return currentLanguageSystemTemplate.replaceFirst('{language}', language);
  }

  String currentLanguageManual(String language) {
    return currentLanguageManualTemplate.replaceFirst('{language}', language);
  }
}
