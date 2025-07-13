import 'package:case_film_app/core/base/model/base_model.dart';
import 'package:case_film_app/core/base/network/base_network_manager.dart';
import 'package:case_film_app/core/constants/enums/locale_keys_enum.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class NetworkManager extends BaseNetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  Dio? _dio;

  BuildContext? context;
  String? language;
  String? url;

  NetworkManager._init() {
    print("base url: $BASE_URL");
    print("TOKEN: ${localeManager.getStringValue(PreferencesKeys.TOKEN)}");
    url = BASE_URL;
    final baseOptions = BaseOptions(
      baseUrl: BASE_URL,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': localeManager.getStringValue(PreferencesKeys.TOKEN)
      },
    );

    _dio = Dio(baseOptions);

    _dio!.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers['Cookie'] =
          localeManager.getStringValue(PreferencesKeys.TOKEN);

      handler.next(options);
    }, onResponse: (e, handler) {
      switch (e.statusCode) {
        case 401:
          // opsiyonel yönlendirme
          break;
        case 404:
          handler.reject(DioException(
            requestOptions: e.requestOptions,
            response: e,
          ));
          return; // early return
        default:
          break;
      }
      handler.next(e); // ❗ bu mutlaka olmalı
    }, onError: (DioException e, handler) async {
      if (e.response != null) {
        if (e.response?.statusCode == 401) {
          // NavigationService.instance
          //     .navigateToPageClear(path: NavigationConstants.LOGIN);
        } else if (e.response?.statusCode == 500) {
          // errorTextHandler(e.response?.data['exceptionCause'], context!);
        }
      }
    }));
  }
  Future dioGet({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    print("Dio get çağırıldı");
    try {
      final response = await _dio!.get(path, queryParameters: queryParameters);
      print("Status Code: ${response.statusCode}");

      switch (response.statusCode) {
        case HttpStatus.ok:
          final responseBody = response.data;
          return responseBody;
        default:
          return null;
      }
    } catch (e, stack) {
      print("Dio HATA: $e");
      print("STACK: $stack");
      return null;
    }
  }

  Future dioPost<T extends BaseModel>(String path, T model) async {
    final response = await _dio!.post(path, data: model);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        print(response.statusCode);

        return responseBody;
      default:
        print(response.statusCode);
        return null;
    }
  }

  Future dioPut<T extends BaseModel>(String path, T model) async {
    final response = await _dio!.put(path, data: model);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        return responseBody;
      default:
        return null;
    }
  }

  Future dioDelete(String path) async {
    final response = await _dio!.delete(path);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final responseBody = response.data;
        return responseBody;
      default:
        return null;
    }
  }

  @override
  void setContext(BuildContext buildContext) {
    // TODO: implement setContext
  }
}
