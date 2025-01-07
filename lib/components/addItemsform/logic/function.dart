// components/addItemsform/logic/function.dart
import 'package:image_picker/image_picker.dart';

class AddItemsFunction {
  static Future<XFile?> uploadimage() async {
    Future<XFile?> picker =
        ImagePicker().pickImage(source: ImageSource.gallery);
    return picker;
  }
}
