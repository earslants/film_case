import 'dart:io';

import 'package:case_film_app/view/profile/model/favorite_model.dart';
import 'package:case_film_app/view/profile/model/profile_model.dart';

abstract class IProfileService {
  Future<ProfileModel?> fetchProfileInfo();
  Future<FavoriteModel?> fetchFavoriteMovies();
  Future<ProfileModel?> uploadPhoto(File imageFile);
}
