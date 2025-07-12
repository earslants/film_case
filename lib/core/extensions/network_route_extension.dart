import 'package:case_film_app/product/enum/network_route.dart';

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return "/user/login";
      case NetworkRoutes.REGISTER:
        return "/user/register";
      case NetworkRoutes.PROFILE:
        return "/user/profile";
      case NetworkRoutes.UPLOAD_PHOTO:
        return "/user/upload_photo";
      case NetworkRoutes.MOVIES:
        return "/movie/list";
      case NetworkRoutes.FAVORITES:
        return "/movie/favorites";
      case NetworkRoutes.FAVORITE:
        return "/movie/favorite/{favoriteId}";
    }
  }
}
