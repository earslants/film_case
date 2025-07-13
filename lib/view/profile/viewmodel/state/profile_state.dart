import 'package:case_film_app/view/profile/model/favorite_model.dart';
import 'package:case_film_app/view/profile/model/profile_model.dart';
import 'package:equatable/equatable.dart';

final class ProfileState extends Equatable {
  const ProfileState({this.favoriteModel, this.profileModel});
  final ProfileModel? profileModel;
  final FavoriteModel? favoriteModel;

  @override
  List<Object?> get props => [profileModel, favoriteModel];

  ProfileState copyWith(
      {ProfileModel? profileModel, FavoriteModel? favoriteModel}) {
    return ProfileState(
        profileModel: profileModel ?? this.profileModel,
        favoriteModel: favoriteModel ?? this.favoriteModel);
  }
}
