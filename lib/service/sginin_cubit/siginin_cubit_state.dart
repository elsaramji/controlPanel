// service/sginin_cubit/siginin_cubit_state.dart
part of 'siginin_cubit_cubit.dart';


abstract class SigninState {}

class SigininInitial extends SigninState {}

class SigninLoading extends SigninState {}

class SigninSuccess extends SigninState {
  final Usermodel user;
  SigninSuccess(this.user);
}

class SigninError extends SigninState {
  final String error;
  SigninError(this.error);
}
