import 'package:asocial/view/onboarding_screens/login_screen.dart';
import 'package:asocial/view/onboarding_screens/name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          width: double.maxFinite,
          height: 950,
          child: Stack(
            children: [
              Image.asset('assets/background.png', fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 55),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 124),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                          text: 'Verification Code',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: const TextSpan(
                          text: 'Please enter verification code sent to',
                          style: TextStyle(fontSize: 18)),
                    ),
                    RichText(
                      text: const TextSpan(
                          text: 'mobile number', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: 250),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 700,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 70),
                        child: Column(
                          children: [
                            Image.asset('assets/verification.png'),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OtpTextField(
                                  numberOfFields: 6,
                                  fieldHeight: 50,
                                  fieldWidth: 50,
                                  borderRadius: BorderRadius.circular(10),
                                  borderColor: Color(0xffA8A8A8),
                                  showFieldAsBox: true,
                                ),
                              ],
                            ),
                            SizedBox(height: 35),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: const TextSpan(
                                      text: "Didn't received code?",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffA8A8A8),
                                      ),
                                    ),
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                      text: "Resend Code",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                        color: Color(0xffD67AEA),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: Column(
                                children: [
                                  GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => NameScreen()));
                                  },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                      width: double.maxFinite,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xffFD4E86),
                                            Color(0xffD67BEC),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Submit',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
