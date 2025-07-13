import 'dart:io';

import 'package:case_film_app/core/constants/enums/locale_keys_enum.dart';
import 'package:case_film_app/core/constants/navigation/navigation_constants.dart';
import 'package:case_film_app/core/extensions/network_route_extension.dart';
import 'package:case_film_app/core/init/cache/locale_manager.dart';
import 'package:case_film_app/core/init/network/network_manager.dart';
import 'package:case_film_app/product/enum/network_route.dart';
import 'package:case_film_app/view/profile/model/favorite_model.dart';
import 'package:case_film_app/view/profile/model/profile_model.dart';
import 'package:case_film_app/view/profile/service/IProfileService.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfileService extends IProfileService {
  BuildContext? context;

  ProfileService({this.context});

  @override
  Future<ProfileModel?> fetchProfileInfo() async {
    try {
      final response = await NetworkManager.instance
          .dioGet(path: NetworkRoutes.PROFILE.rawValue);

      if (response != null) {
        return ProfileModel.fromJson(response);
      }
    } catch (e) {
      print("Hata: $e");
    }
    return null;
  }

  @override
  Future<FavoriteModel?> fetchFavoriteMovies() async {
    try {
      final response = await NetworkManager.instance
          .dioGet(path: NetworkRoutes.FAVORITES.rawValue);

      if (response != null) {
        return FavoriteModel.fromJson(response);
      }
    } catch (e) {
      print("Hata: $e");
    }
    return null;
  }

  @override
  Future<ProfileModel?> uploadPhoto(File imageFile) async {
    final dio = Dio();

    final String url = "https://caseapi.servicelabs.tech/user/upload_photo";

    try {
      String fileName = imageFile.path;

      // FormData oluştur
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          imageFile.path,
          filename: fileName,
        ),
      });

      // İstek gönder
      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            "Authorization":
                LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN),
            // "Content-Type" manuel ekleme, Dio bunu otomatik ayarlıyor!
          },
        ),
      );

      print("Yükleme başarılı: ${response.data}");
    } on DioException catch (e) {
      print("Yükleme hatası: ${e.response?.data ?? e.message}");
    }
    return null;
  }
}
