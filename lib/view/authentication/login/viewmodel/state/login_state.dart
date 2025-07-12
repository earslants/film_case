import 'package:case_film_app/view/authentication/login/model/login_response_model.dart';
import 'package:equatable/equatable.dart';

final class LoginState extends Equatable {
  const LoginState({
    required this.isLoading,
    required this.isSuccess,
    this.loginResponseModel,
  });

  final bool isLoading;
  final bool isSuccess;
  final LoginResponseModel? loginResponseModel;

  @override
  List<Object?> get props => [isLoading, isSuccess, loginResponseModel];

  LoginState copyWith({
    bool? isLoading,
    bool? isSuccess,
    LoginResponseModel? loginResponseModel,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      loginResponseModel: loginResponseModel ?? this.loginResponseModel,
    );
  }
}
