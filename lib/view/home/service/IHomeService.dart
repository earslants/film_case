import 'package:case_film_app/view/home/model/movies.dart';

abstract class IHomeService {
  Future<Movies?> fetchAllMovies();
}
