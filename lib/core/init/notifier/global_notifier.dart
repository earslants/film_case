import 'dart:ui';

import 'package:case_film_app/core/constants/enums/locale_keys_enum.dart';
import 'package:case_film_app/core/init/cache/locale_manager.dart';
import 'package:case_film_app/product/lang/language_interceptor.dart';
import 'package:flutter/foundation.dart';

class GlobalNotifier with ChangeNotifier {
  Locale _locale = const Locale('tr', 'TR');

  Locale get locale => _locale;

  GlobalNotifier() {
    _loadSavedLocale();
  }

  void _loadSavedLocale() {
    final locale =
        LocaleManager.instance.getStringValue(PreferencesKeys.LOCALE_KEY);

    final parts = locale.split('_');
    if (parts.length == 2) {
      _locale = Locale(parts[0], parts[1]);
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale newLocale) async {
    if (_locale == newLocale) return;
    _locale = newLocale;
    LanguageInterceptor.setLanguage(newLocale.languageCode);

    LocaleManager.instance.setStringValue(PreferencesKeys.LOCALE_KEY,
        '${newLocale.languageCode}_${newLocale.countryCode}');
    notifyListeners();
  }

  Future<void> setTurkish() async {
    await setLocale(const Locale('tr', 'TR'));
  }

  Future<void> setEnglish() async {
    await setLocale(const Locale('en', 'US'));
  }

  // Get current language code
  String get currentLanguageCode => _locale.languageCode;

  // Check if current language is Turkish
  bool get isTurkish => _locale.languageCode == 'tr';

  // Check if current language is English
  bool get isEnglish => _locale.languageCode == 'en';
}
