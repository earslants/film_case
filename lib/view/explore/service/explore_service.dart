import 'package:case_film_app/core/constants/enums/locale_keys_enum.dart';
import 'package:case_film_app/core/extensions/network_route_extension.dart';
import 'package:case_film_app/core/init/cache/locale_manager.dart';
import 'package:case_film_app/core/init/network/network_manager.dart';
import 'package:case_film_app/product/enum/network_route.dart';
import 'package:dio/dio.dart';
import 'package:case_film_app/view/home/model/movies.dart';
import 'package:case_film_app/view/explore/service/IExploreService.dart';
import 'package:flutter/material.dart';

class ExploreService extends IExploreService {
  BuildContext? context;

  ExploreService({this.context});

  @override
  Future<Movies?> fetchAllMovies() async {
    try {
      print("ÇALIŞTI");

      // final dio = Dio(
      //   BaseOptions(
      //     baseUrl: "https://caseapi.servicelabs.tech", // BASE_URL burada sabit
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'Authorization': LocaleManager.instance.getStringValue(
      //         PreferencesKeys.TOKEN,
      //       )
      //     },
      //     connectTimeout: const Duration(seconds: 10),
      //     receiveTimeout: const Duration(seconds: 10),
      //   ),
      // );

      final response = await NetworkManager.instance
          .dioGet(path: NetworkRoutes.MOVIES.rawValue);

      if (response != null) {
        return Movies.fromJson(response);
      }
    } catch (e) {
      print("Dio HATA: $e");
    }
    return null;
  }
}
