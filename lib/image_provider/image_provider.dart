import 'package:image_picker/image_picker.dart';

class Capture{

  static Future<String> getImage(String src) async{
    ImagePicker picker = ImagePicker();
    if(src == 'camera'){
      XFile? image = await picker.pickImage(source: ImageSource.camera);
      if(image!.path.isNotEmpty){
        return image.path;
      }
      else{
        return '';
      }
    }
    else if(src == 'gallery'){
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if(image!.path.isNotEmpty){
        return image.path;
      }
      else{
        return '';
      }
    }
    else{
      return '';
    }
  }

}