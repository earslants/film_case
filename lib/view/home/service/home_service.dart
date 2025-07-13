import 'package:case_film_app/core/extensions/network_route_extension.dart';
import 'package:case_film_app/product/enum/network_route.dart';
import 'package:case_film_app/view/home/model/movies.dart';
import 'package:case_film_app/view/home/service/IHomeService.dart';
import 'package:flutter/material.dart';

import '../../../core/init/network/network_manager.dart';

class HomeService extends IHomeService {
  BuildContext? context;

  HomeService({this.context});

  @override
  Future<Movies?> fetchAllMovies() async {
    try {
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
