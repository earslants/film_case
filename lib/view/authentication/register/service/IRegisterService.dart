import 'package:case_film_app/view/authentication/register/model/register_request_model.dart';
import 'package:case_film_app/view/authentication/register/model/register_response_model.dart';

abstract class IRegisterService {
  Future<RegisterResponseModel?> register(RegisterRequestModel registerModel);
}
