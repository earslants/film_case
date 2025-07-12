import 'package:case_film_app/core/base/model/base_model.dart';
import 'package:case_film_app/view/authentication/login/model/response_model.dart';
import 'package:case_film_app/view/authentication/login/model/user_data.dart';
import 'package:case_film_app/view/authentication/login/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final ResponseModel response;
  final UserData data;

  LoginResponseModel({required this.response, required this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @override
  Map<String, Object?> toJson() => _$LoginResponseModelToJson(this);
}
