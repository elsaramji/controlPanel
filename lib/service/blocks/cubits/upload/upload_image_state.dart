// service/blocks/cubits/upload/upload_image_state.dart
part of 'upload_image_cubit.dart';

abstract class UploadImageState {}

class UploadImageInitial extends UploadImageState {}

class UploadImageSuccess extends UploadImageState {
  final String imageUrl;
  UploadImageSuccess(this.imageUrl);
}

class UploadImageError extends UploadImageState {
  final String message;
  UploadImageError(this.message);
}

class UploadImageLoading extends UploadImageState {}
