// components/addItemsform/logic/function.dart
import 'package:image_picker/image_picker.dart';

//TODO: AddItemsFunctionCubit

class PickImageFunction {
  static Future<XFile?> pickimagelocal() async {
    Future<XFile?> picker =
        ImagePicker().pickImage(source: ImageSource.gallery);
    return picker;
  }
}
