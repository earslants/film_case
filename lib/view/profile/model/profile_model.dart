import 'package:case_film_app/view/authentication/login/model/response_model.dart';
import 'package:case_film_app/view/authentication/login/model/user_data.dart';
import 'package:case_film_app/view/profile/model/profile_response_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  ResponseModel response;
  ProfileResponseData data;

  ProfileModel({required this.response, required this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
