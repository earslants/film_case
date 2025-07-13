import 'package:case_film_app/view/home/model/movies.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({this.movies});

  final Movies? movies;

  @override
  List<Object?> get props => [movies];

  HomeState copyWith({Movies? movies}) {
    return HomeState(
      movies: movies ?? this.movies,
    );
  }
}
