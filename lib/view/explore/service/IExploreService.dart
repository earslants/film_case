import 'package:case_film_app/view/explore/model/movies.dart';

abstract class IExploreService {
  Future<Movies?> fetchAllMovies();
}
