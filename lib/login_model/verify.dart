import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_game/login_model/login_model.dart';
import 'package:flutter_application_game/profile_model/profile.dart';
import 'package:provider/provider.dart';

class OTPVerificationScreen extends StatelessWidget {
  final List<TextEditingController> otpControllers =
      List.generate(4, (_) => TextEditingController());
 
  OTPVerificationScreen({super.key, this.mobileNumber});
 String? mobileNumber;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(initMeth: false),
      child: Consumer<AuthProvider>(
        builder: (context, provider, child) => Scaffold(
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Image.asset('assests/images/snakeup.png', width: 120),
                      Image.asset('assests/images/snake.png', width: 120),
                      const SizedBox(height: 10),
                      const Text(
                        "OTP Verification",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(255, 250, 42, 1),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Verification Code Have Been\nSent To Your Mobile Number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          4,
                          (index) => SizedBox(
                            width: 75,
                            child: TextField(
                              controller: otpControllers[index],
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFFFA2A),
                                    width: 2,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFFFA2A),
                                    width: 2,
                                  ),
                                ),
                                filled: true,
                                fillColor: const Color.fromRGBO(0, 63, 63, 1),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFFFA2A),
                                    width: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Didn't receive the code?",
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Resend OTP 00:26",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(

                        onPressed: provider.isLoading
                            ? null
                            : () {
                                String otp = otpControllers
                                    .map((e) => e.text)
                                    .join()
                                    .trim();
                                provider.verifyOtp(mobileNumber
                                !,otp,context);
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
                        child: provider.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : const Text(
                                "VERIFY OTP",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
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
}
