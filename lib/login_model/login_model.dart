import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_game/login_model/verify.dart';
import 'package:flutter_application_game/profile_model/profile.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  bool? initMeth;
  bool isLoading = false;

  AuthProvider({required this.initMeth});

  Future<void> sendPhoneNumber(String phoneNumber,BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {

    final response = await  http.post(
    Uri.parse('http://35.180.57.31:7000/user/send-otp'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{"mobileNumber": phoneNumber},),
  );
   

      if (response.statusCode == 200) {
      
        print("OTP sent successfully!");
        Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
      return new OTPVerificationScreen(mobileNumber:phoneNumber ,);
    }));
      } else {
        print("Failed to send OTP: ${response.body}");
      }
    } catch (e) {
      print("Error: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> verifyOtp(String mobile, String otp, BuildContext context) async {
    isLoading = true;
    notifyListeners();
  // Create the API body
  final Map<String, dynamic> requestBody = {
    'mobileNumber': mobile,
    'otp': otp,
  };
    try {
      // final response = await http.post(
      //   Uri.parse("http://35.180.57.31:7000/user/verify-otp"),
      
        final response = await  http.post(
    Uri.parse('http://35.180.57.31:7000/user/verify-otp'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestBody),
  
  );

      if (response.statusCode == 200) {
        print("OTP Verified!");
        
                          Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
      return  CreateProfileScreen(mobile:mobile);
    }));
   
      } else {
        print("Verification failed: ${response.body}");
      }
    } catch (e) {
      print("Verification error: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}
