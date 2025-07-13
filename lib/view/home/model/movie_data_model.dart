import 'package:case_film_app/view/home/model/movie_model.dart';
import 'package:case_film_app/view/home/model/pagination_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_data_model.g.dart';

@JsonSerializable()
class MovieDataModel {
  List<MovieModel> movies;
  PaginationModel pagination;

  MovieDataModel({
    required this.movies,
    required this.pagination,
  });

  factory MovieDataModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDataModelToJson(this);
}
