import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  String id;
  @JsonKey(name: '_id')
  String movieId;

  @JsonKey(name: 'Title')
  String title;

  @JsonKey(name: 'Year')
  String year;

  @JsonKey(name: 'Rated')
  String rated;

  @JsonKey(name: 'Released')
  String released;

  @JsonKey(name: 'Runtime')
  String runtime;

  @JsonKey(name: 'Genre')
  String genre;

  @JsonKey(name: 'Director')
  String director;

  @JsonKey(name: 'Writer')
  String writer;

  @JsonKey(name: 'Actors')
  String actors;

  @JsonKey(name: 'Plot')
  String plot;

  @JsonKey(name: 'Language')
  String language;

  @JsonKey(name: 'Country')
  String country;

  @JsonKey(name: 'Awards')
  String awards;

  @JsonKey(name: 'Poster')
  String poster;

  @JsonKey(name: 'Metascore')
  String metascore;

  @JsonKey(name: 'imdbRating')
  String imdbRating;

  @JsonKey(name: 'imdbVotes')
  String imdbVotes;

  @JsonKey(name: 'imdbID')
  String imdbId;

  @JsonKey(name: 'Type')
  String type;

  @JsonKey(name: 'Response')
  String response;

  @JsonKey(name: 'Images')
  List<String> images;

  @JsonKey(name: 'ComingSoon')
  bool comingSoon;

  @JsonKey(name: 'isFavorite')
  bool isFavorite;

  MovieModel({
    required this.id,
    required this.movieId,
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.response,
    required this.images,
    required this.comingSoon,
    required this.isFavorite,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  @override
  Map<String, Object?> toJson() => _$MovieModelToJson(this);
}
