import 'package:case_film_app/core/constants/enums/locale_keys_enum.dart';
import 'package:case_film_app/core/init/cache/locale_manager.dart';
import 'package:case_film_app/view/authentication/login/model/login_request_model.dart';
import 'package:case_film_app/view/authentication/login/service/ILoginService.dart';
import 'package:case_film_app/view/authentication/login/service/login_service.dart';
import 'package:case_film_app/view/authentication/login/viewmodel/state/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewModel extends Cubit<LoginState> {
  LoginViewModel({
    required LoginService loginService,
  })  : _loginService = loginService,
        super(const LoginState(isLoading: false));

  late final LoginService _loginService;

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  void fetchLogin(LoginRequestModel loginRequestModel) async {
    final response = await _loginService.fetchLogin(loginRequestModel);

    if (response != null) {
      LocaleManager.instance.setStringValue(
          PreferencesKeys.TOKEN, "Bearer ${response.data.token}");
      emit(state.copyWith(loginResponseModel: response));
      changeLoading();
      print(
          "TOKEN: ${LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)}");
    }
  }
}
