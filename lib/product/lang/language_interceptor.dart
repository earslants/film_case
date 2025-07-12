import 'package:dio/dio.dart';

class LanguageInterceptor extends Interceptor {
  static String _currentLanguage = "tr-TR";

  // Dil kodunu güncellemek için statik metod
  static void setLanguage(String languageCode) {
    // Dil kodunu büyük harfe çevir
    _currentLanguage = languageCode.toUpperCase();
  }
}
