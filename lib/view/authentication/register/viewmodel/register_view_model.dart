import 'package:case_film_app/core/constants/enums/locale_keys_enum.dart';
import 'package:case_film_app/core/init/cache/locale_manager.dart';
import 'package:case_film_app/view/authentication/register/model/register_request_model.dart';
import 'package:case_film_app/view/authentication/register/service/IRegisterService.dart';
import 'package:case_film_app/view/authentication/register/viewmodel/state/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterState> {
  RegisterViewModel({
    required IRegisterService registerService,
  })  : _registerService = registerService,
        super(const RegisterState(isLoading: false));

  final IRegisterService _registerService;

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> register(RegisterRequestModel registerRequestModel) async {
    emit(state.copyWith(isLoading: true));

    final response = await _registerService.register(registerRequestModel);

    if (response != null) {
      LocaleManager.instance.setStringValue(
          PreferencesKeys.TOKEN, "Bearer ${response.data.token}");
      print("TOKEN: ${response.data.token}");
      emit(state.copyWith(
        isLoading: false,
        registerResponseModel: response,
      ));
    } else {
      emit(state.copyWith(isLoading: false));
      // TODO: hata durumunu da state ile yönet
    }
  }
}
