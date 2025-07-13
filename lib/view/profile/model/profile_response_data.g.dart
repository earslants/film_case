// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseData _$ProfileResponseDataFromJson(Map<String, dynamic> json) =>
    ProfileResponseData(
      idMongo: json['_id'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$ProfileResponseDataToJson(
        ProfileResponseData instance) =>
    <String, dynamic>{
      '_id': instance.idMongo,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
    };
