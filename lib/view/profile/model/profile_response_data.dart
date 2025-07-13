import 'package:json_annotation/json_annotation.dart';

part 'profile_response_data.g.dart';

@JsonSerializable()
class ProfileResponseData {
  @JsonKey(name: '_id')
  final String idMongo;

  final String id;
  final String name;
  final String email;
  final String? photoUrl;

  ProfileResponseData({
    required this.idMongo,
    required this.id,
    required this.name,
    required this.email,
    this.photoUrl,
  });

  factory ProfileResponseData.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseDataToJson(this);
}
