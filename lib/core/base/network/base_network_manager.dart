import 'package:case_film_app/core/init/cache/locale_manager.dart';
import 'package:flutter/material.dart';

abstract class BaseNetworkManager {
  late BuildContext buildContext;
  String BASE_URL =
      "https://caseapi.servicelabs.tech"; // TODO Base URL .env içerisinden çekilecek.

  LocaleManager localeManager = LocaleManager.instance;
  void setContext(BuildContext buildContext);
}
