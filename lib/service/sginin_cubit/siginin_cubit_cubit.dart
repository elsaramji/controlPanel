// service/sginin_cubit/siginin_cubit_cubit.dart
import 'package:bloc/bloc.dart';

import '../../core/models/user_entity.dart';
import '../firebase/auth.dart';

part 'siginin_cubit_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.auth) : super(SigininInitial());

  final FirebaseAuthService auth;
  Future<void> signInWithemailandpassword(
      {required String email, required String password}) async {

      emit(SigninLoading());
      final result = await auth.signInWithEmailAndPassword(email, password);
      result.fold((l) {
        emit(SigninError(l.message));
      }, (r) {
        emit(SigninSuccess(r));
      });
    
  }
}
