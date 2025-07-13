import 'dart:io';

import 'package:case_film_app/view/profile/service/IProfileService.dart';
import 'package:case_film_app/view/profile/viewmodel/state/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewModel extends Cubit<ProfileState> {
  ProfileViewModel({
    required IProfileService profileService,
  })  : _profileService = profileService,
        super(const ProfileState());

  final IProfileService _profileService;

  Future<void> fetchProfileInfo() async {
    final response = await _profileService.fetchProfileInfo();

    if (response != null) {
      print("PROFILE INFO: ${response.data.name}");

      emit(state.copyWith(
        profileModel: response,
      ));
    }
  }

  Future<void> fetchFavoriteMovies() async {
    final response = await _profileService.fetchFavoriteMovies();

    if (response != null) {
      print("FAVORITE FİLMS: ${response.data.first.actors}");
      emit(state.copyWith(
        favoriteModel: response,
      ));
    }
  }

  Future<void> uploadPhoto(File fileName) async {
    final response = await _profileService.uploadPhoto(fileName);

    if (response != null) {
      print("PHOTO URL: ${response.data.photoUrl}");
      emit(state.copyWith(
        profileModel: response,
      ));
    }
  }
}
