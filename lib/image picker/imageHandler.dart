import 'dart:convert';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class image_Handler{
  image_Handler._();
  static image_Handler instance = image_Handler._();
  ImagePicker picker = ImagePicker();

  Future<String> pickImage () async{
    try{
      if(!await Permission.camera.status.isGranted || !await Permission.storage.status.isGranted){
        await Permission.camera.request();
        await Permission.storage.request();
        //pickImage();
      }
      else if(await Permission.camera.status.isGranted){
      final response = await picker.pickImage(source: ImageSource.gallery);

      if(response != null){
        var take = response.path;
        return take;
      }

      }
    }
    catch(e){
      print(e);
    }
    return "";
  }

 Future<String> uploadProfile(String file) async{
    try{
      String cloudName = 'ddzl716mr';
      String uploadPreset = "instagram-clone";
     
      String uri = "https://api.cloudinary.com/v1_1/$cloudName/file/upload";

      final response = http.MultipartRequest("POST",Uri.parse(uri));
      final filePut = await http.MultipartFile.fromPath("file" , file);
      response.files.add(filePut);
      response.fields["upload_preset"] = uploadPreset;
      print("wow");

     final send = await response.send();

      print("step 3");
      var converit = await send.stream.bytesToString();

      var yehy = jsonDecode(converit);
      if(send.statusCode == 200){
        return yehy['secure_url'];
      }

    }
    catch(e){
      print(e);
    }
    return "";
  }
}