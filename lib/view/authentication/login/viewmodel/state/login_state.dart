import 'package:case_film_app/view/authentication/login/model/login_response_model.dart';
import 'package:equatable/equatable.dart';

final class LoginState extends Equatable {
  const LoginState({required this.isLoading, this.loginResponseModel});
  final bool isLoading;
  final LoginResponseModel? loginResponseModel;

  @override
  List<Object?> get props => [isLoading, loginResponseModel];

  LoginState copyWith(
      {bool? isLoading, LoginResponseModel? loginResponseModel}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      loginResponseModel: loginResponseModel ?? this.loginResponseModel,
    );
  }
}
