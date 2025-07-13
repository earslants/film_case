import 'package:case_film_app/view/authentication/login/model/response_model.dart';
import 'package:case_film_app/view/home/model/movie_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@JsonSerializable()
class FavoriteModel {
  ResponseModel response;
  List<MovieModel> data;

  FavoriteModel({required this.response, required this.data});

  factory FavoriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavoriteModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteModelToJson(this);
}
