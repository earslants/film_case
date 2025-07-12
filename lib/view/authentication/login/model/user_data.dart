import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  final String idMongo;

  final String id;
  final String name;
  final String email;
  final String? photoUrl;
  final String token;

  UserData({
    required this.idMongo,
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
    required this.token,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
