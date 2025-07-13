import 'package:case_film_app/view/home/service/IHomeService.dart';
import 'package:case_film_app/view/home/service/home_service.dart';
import 'package:case_film_app/view/home/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';

mixin HomeViewMixin<T extends StatefulWidget> on State<T> {
  late final IHomeService homeService;
  late final HomeViewModel _homeViewModel;

  HomeViewModel get homeViewModel => _homeViewModel;

  @override
  void initState() {
    super.initState();
    homeService = HomeService(context: context);
    _homeViewModel = HomeViewModel(homeService: homeService);
    _homeViewModel.fetchAllMovies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
