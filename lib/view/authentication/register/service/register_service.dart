import 'package:case_film_app/core/extensions/network_route_extension.dart';
import 'package:case_film_app/core/init/network/network_manager.dart';
import 'package:case_film_app/product/enum/network_route.dart';
import 'package:case_film_app/view/authentication/register/model/register_request_model.dart';
import 'package:case_film_app/view/authentication/register/model/register_response_model.dart';
import 'package:case_film_app/view/authentication/register/service/IRegisterService.dart';
import 'package:flutter/material.dart';

class RegisterService extends IRegisterService {
  BuildContext? context;

  RegisterService({this.context});

  @override
  Future<RegisterResponseModel?> register(
      RegisterRequestModel registerModel) async {
    NetworkManager.instance.setContext(context!);
    try {
      print("ÇALIŞTI");
      final response = await NetworkManager.instance
          .dioPost(NetworkRoutes.REGISTER.rawValue, registerModel);

      if (response != null) {
        print("RESPONSE $response");
        return RegisterResponseModel.fromJson(response);
      } else {
        print("RESPONSE NULL");
      }
    } catch (e) {
      print("Bir hata Oluştu");
    }
    return null;
  }
}
