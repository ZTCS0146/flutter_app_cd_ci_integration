import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_game/home_model/home_ui.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class ProfileProvider with ChangeNotifier {
  File? profileImage;
  bool isLoading = false;

  final picker = ImagePicker();

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> submitProfile(String name,String mobile,String username,BuildContext context, filepath) async {
    if (username.isEmpty || profileImage == null) return;

    isLoading = true;
    notifyListeners();

  //   final uri = Uri.parse("https://your-api-url.com/profile");
  //   final request = http.MultipartRequest("POST", uri)
  //     ..fields['Name'] = name
  //      ..fields['mobileNumber'] = mobile

  //       ..fields['userName'] = username
  //     ..files.add(await http.MultipartFile.fromPath('profilePic', filepath));

  //   try {
  //     final response = await request.send();
  //     if (response.statusCode == 200) {
  //       print("Profile created successfully");
  //                        Navigator
  //       .of(context)
  //       .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
  //     return new HomePage();
  //   }));
  //     } else {
  //       print("Failed to create profile");
  //     }
  //   } catch (e) {
  //     print("Error: $e");
  //   }

  //   isLoading = false;
  //   notifyListeners();
  // }

  final dio = Dio();
 String fileName = filepath.path.split('/').last;
 FormData formData = FormData.fromMap({
   'profilePic': await MultipartFile.fromFile(
     filepath.path,
     filename: fileName,
    //  contentType: MediaType('image', 'jpeg'), // Add if needed
   ),
   'Name': name,
  'mobileNumber':mobile,

  'userName':username,
 });
 try {
   Response response = await dio.post(
     'https://your-api-url.com/profile',
     data: formData,
     options: Options(
       headers: {
         'Content-Type': 'multipart/form-data',
       },
     ),
   );
         if (response.statusCode == 200) {
        print("Profile created successfully");
                         Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
      return new HomePage();
    }));
      isLoading = false;
    notifyListeners();
         }
 } catch (e) {
   print('Upload Failed: $e');
     isLoading = false;
    notifyListeners();
 }
    isLoading = false;
    notifyListeners();
}

}