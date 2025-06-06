import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_game/login_model/login_model.dart';
import 'package:flutter_application_game/login_model/verify.dart';
import 'package:provider/provider.dart';


class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final authProvider = Provider.of<AuthProvider>(context);

    return 
    ChangeNotifierProvider(
        create: (_) => AuthProvider(initMeth: false, ),
        child: Consumer<AuthProvider>(
       builder: (context, authProvider, child) =>
    Scaffold(
      body:      Container(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                    Image.asset('assests/images/snakeup.png', width: 120),
              
                  Image.asset('assests/images/snake.png', width: 120),
                  // const SizedBox(height: 10),
                  const Text(
                    "Welcome To",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                  const Text(
                    "🐍Snakes And \n      Ladders 🪜",
                    style: TextStyle(
                      fontSize: 18,
                       color: Color.fromRGBO(255, 250, 42, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                       color: Color.fromRGBO(255, 250, 42, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 63, 63, 1),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all( color: Color.fromRGBO(255, 250, 42, 1), width: 2),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "🇮🇳 +91",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
  controller: _phoneController,
  keyboardType: TextInputType.phone,
  inputFormatters: [
    LengthLimitingTextInputFormatter(10),
    FilteringTextInputFormatter.digitsOnly,
  ],
  style: const TextStyle(color: Colors.white),
  decoration: const InputDecoration(
    border: InputBorder.none,
    hintText: "XXXX-XXX-XXX",
    hintStyle: TextStyle(color: Colors.grey),
  ),
),

                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120),
                  ElevatedButton(
                  
                    onPressed: authProvider.isLoading
                        ? null
                        : () {
                            final phone = _phoneController.text.trim();
                            authProvider.sendPhoneNumber(phone,context);
                          },
                    style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(255, 188, 0, 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(
        color: Colors.black, // Yellow border
        width: 2,
      ),
    ),
   
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: authProvider.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "SEND",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16,color: Colors.white),
                          ),
                  ),
                   const SizedBox(height: 200),
                ],
              ),
            ),
          ),
        ),
      ),
    )));
  }
}
