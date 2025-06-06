import 'package:flutter/material.dart';
import 'package:flutter_application_game/home_model/home_ui.dart';
import 'package:flutter_application_game/profile_model/profile_model.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class CreateProfileScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
String? mobile;
  CreateProfileScreen({super.key, this.mobile});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileProvider(),
      child: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assests/images/bg.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.teal.withOpacity(0.9), // Colored overlay
                  BlendMode.srcATop,
                ),
              ),
            ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Consumer<ProfileProvider>(
                builder: (context, provider, _) => SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Image.asset('assests/images/snakeup.png', width: 120),
                      Image.asset('assests/images/snake.png', width: 120),
                      const SizedBox(height: 10),
                      const Text(
                        "Create Profile",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.yellow),
                      ),
                      const Text(
                        "Set Up Your Profile Page\nAnd Enjoy The Game!",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 63, 63, 1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.yellow, width: 2),
                        ),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () => provider.pickImage(),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundColor: Colors.yellow,
                                child: provider.profileImage != null
                                    ? ClipOval(
                                        child: Image.file(
                                          File(provider.profileImage!.path),
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : const Icon(Icons.camera_alt, color: Colors.black, size: 30),
                              ),
                            ),
                            const SizedBox(height: 20),
                            _buildInputField("Select User Name", _nameController),
                            const SizedBox(height: 10),
                            _buildInputField("Choose Your Name", _userController),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                      
                        
                        onPressed: 
                        // provider.isLoading
                        //     ? null
                           () {
                                                Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
      return new HomePage();
    }));
                              // File file = File(provider.profileImage!.path);
                              // provider.submitProfile(_nameController.text,mobile!,_userController.text,context,file);
                            } ,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(255, 188, 0, 1),
                          side: const BorderSide(color: Colors.black, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        ),
                        child: provider.isLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : const Text(
                                "CREATE",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                              ),
                      ),
                       const SizedBox(height: 200),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        filled: true,
        fillColor: const Color.fromRGBO(0, 63, 63, 1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.yellow, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.yellow, width: 2),
        ),
      ),
    );
  }
}
