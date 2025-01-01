// service/forgetpassword/forgetpassword_state.dart
part of 'forgetpassword_cubit.dart';

@immutable
abstract class ForgetpasswordState {}

class ForgetpasswordInitial extends ForgetpasswordState {}
class ForgetpasswordSuccess extends ForgetpasswordState {}

class ForgetpasswordError extends ForgetpasswordState {
  final String message;
  ForgetpasswordError(this.message);
}
class ForgetpasswordLoading extends ForgetpasswordState {}


