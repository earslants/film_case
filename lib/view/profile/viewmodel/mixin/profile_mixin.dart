import 'package:case_film_app/view/profile/service/IProfileService.dart';
import 'package:case_film_app/view/profile/service/profile_service.dart';
import 'package:case_film_app/view/profile/viewmodel/profile_view_model.dart';
import 'package:flutter/material.dart';

mixin ProfileViewMixin<T extends StatefulWidget> on State<T> {
  late final IProfileService profileService;
  late final ProfileViewModel _profileViewModel;

  ProfileViewModel get profileViewModel => _profileViewModel;

  @override
  void initState() {
    profileService = ProfileService(context: context);
    _profileViewModel = ProfileViewModel(profileService: profileService);
    _profileViewModel.fetchProfileInfo();
    _profileViewModel.fetchFavoriteMovies();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
