// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movies _$MoviesFromJson(Map<String, dynamic> json) => Movies(
      response:
          ResponseModel.fromJson(json['response'] as Map<String, dynamic>),
      data: MovieDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoviesToJson(Movies instance) => <String, dynamic>{
      'response': instance.response,
      'data': instance.data,
    };
