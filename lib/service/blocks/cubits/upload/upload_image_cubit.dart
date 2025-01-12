// service/blocks/cubits/upload/upload_image_cubit.dart
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:furits_control/service/supbace/storage_supbase.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit() : super(UploadImageInitial());

  void uploadimage(
      {required StorageSupbase supbase,
      required File file,
      required String productid}) async {
    emit(UploadImageLoading());
    try {
      final result =
          await supbase.uploadImage_supbase(file: file, productid: productid);
      result.fold((l) {
        emit(UploadImageError(l.message));
      }, (r) {
        emit(UploadImageSuccess(r));
      });
    } catch (e) {
      emit(UploadImageError(e.toString()));
    }
  }
}
