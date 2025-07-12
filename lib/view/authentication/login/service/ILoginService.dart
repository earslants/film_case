import 'package:case_film_app/view/authentication/login/model/login_request_model.dart';
import 'package:case_film_app/view/authentication/login/model/login_response_model.dart';

abstract class ILoginService {
  Future<LoginResponseModel?> fetchLogin(LoginRequestModel loginModel);
}
