import 'package:case_film_app/view/authentication/register/model/register_response_model.dart';
import 'package:equatable/equatable.dart';

final class RegisterState extends Equatable {
  const RegisterState({required this.isLoading, this.registerResponseModel});
  final bool isLoading;
  final RegisterResponseModel? registerResponseModel;

  @override
  List<Object?> get props => [isLoading, registerResponseModel];

  RegisterState copyWith(
      {bool? isLoading, RegisterResponseModel? registerResponseModel}) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      registerResponseModel:
          registerResponseModel ?? this.registerResponseModel,
    );
  }
}
