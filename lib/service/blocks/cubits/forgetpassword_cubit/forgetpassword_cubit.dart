// service/blocks/cubits/forgetpassword_cubit/forgetpassword_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../firebase/auth.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  final FirebaseAuthService auth;
  ForgetpasswordCubit({required this.auth}) : super(ForgetpasswordInitial());

  Future<void> forgetpassword(String email) async {
    emit(ForgetpasswordLoading());
    try {
      await auth.forgetpassword(email);
      emit(ForgetpasswordSuccess());
    } catch (e) {
      emit(ForgetpasswordError("ربما هناك خطاء ما  الرجاء اعادة المحاولة"));
    }
  }
}
