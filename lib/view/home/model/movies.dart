import 'package:case_film_app/view/authentication/login/model/response_model.dart';
import 'package:case_film_app/view/home/model/movie_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movies.g.dart';

@JsonSerializable()
class Movies {
  ResponseModel response;
  MovieDataModel data;

  Movies({
    required this.response,
    required this.data,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesToJson(this);
}
