import 'package:case_film_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable()
class LoginRequestModel extends BaseModel {
  String email;
  String password;

  LoginRequestModel({required this.email, required this.password});

  @override
  fromJson(Map<String, dynamic> json) => _$LoginRequestModelFromJson(json);

  @override
  Map<String, Object?> toJson() => _$LoginRequestModelToJson(this);
}
