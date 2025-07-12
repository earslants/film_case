import 'package:case_film_app/core/base/model/base_model.dart';
import 'package:case_film_app/view/authentication/login/model/response_model.dart';
import 'package:case_film_app/view/authentication/login/model/user_data.dart';
import 'package:case_film_app/view/authentication/login/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  ResponseModel? response;
  UserData? data;

  RegisterResponseModel({this.response, this.data});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, Object?> toJson() => _$RegisterResponseModelToJson(this);
}
