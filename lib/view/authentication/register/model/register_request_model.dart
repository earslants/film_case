import 'package:case_film_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel extends BaseModel {
  String email;
  String name;
  String password;

  RegisterRequestModel({
    required this.email,
    required this.name,
    required this.password,
  });

  @override
  fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);

  @override
  Map<String, Object?> toJson() => _$RegisterRequestModelToJson(this);
}
