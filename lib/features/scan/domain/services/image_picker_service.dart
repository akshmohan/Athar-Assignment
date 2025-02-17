import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> pickImage() async{
    return await _imagePicker.pickImage(source: ImageSource.camera);
  }
}