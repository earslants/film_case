import 'package:case_film_app/core/extensions/network_route_extension.dart';
import 'package:case_film_app/core/init/network/network_manager.dart';
import 'package:case_film_app/product/enum/network_route.dart';
import 'package:case_film_app/view/authentication/login/model/login_request_model.dart';
import 'package:case_film_app/view/authentication/login/model/login_response_model.dart';
import 'package:case_film_app/view/authentication/login/service/ILoginService.dart';
import 'package:flutter/material.dart';

class LoginService extends ILoginService {
  BuildContext? context;

  LoginService({this.context});

  @override
  Future<LoginResponseModel?> fetchLogin(LoginRequestModel loginModel) async {
    NetworkManager.instance.setContext(context!);
    try {
      print("ÇALIŞTI");
      final response = await NetworkManager.instance
          .dioPost(NetworkRoutes.LOGIN.rawValue, loginModel);
      if (response != null) {
        print("RESPONSE $response");
        return LoginResponseModel.fromJson(response);
      } else {
        print("RESPONSE NULL");
      }
    } catch (e) {
      print("Bir hata oluştu: $e");
    }
    return null;
  }
}
