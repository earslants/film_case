import 'package:case_film_app/view/home/service/IHomeService.dart';
import 'package:case_film_app/view/home/viewmodel/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel({
    required IHomeService homeService,
  })  : _homeService = homeService,
        super(const HomeState());

  final IHomeService _homeService;

  Future<void> fetchAllMovies() async {
    try {
      final response = await _homeService.fetchAllMovies();

      if (response != null) {
        emit(state.copyWith(
          movies: response,
        ));
      }
    } catch (e) {
      print("HATA: $e");
    }
  }
}
