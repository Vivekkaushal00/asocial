import 'dart:async';

import 'package:asocial/splash_screen.dart';
import 'package:asocial/try_for_free.dart';
import 'package:asocial/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Stack(
          children: [
            Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 100),
                Image.asset('assets/asocial.png'),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 690,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/welcome.png'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'A new and exciting way to meet',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade400),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'people',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                            TextFormField(
                            keyboardType: TextInputType.phone,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 10),
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 0.5,
                                                color:
                                                    Colors.grey.shade300))),
                                    child: Image.asset('assets/phone.png')),
                              ),
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(
                                  fontSize: 18, color: Colors.grey.shade300),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Checkbox(
                                  activeColor: Colors.pink,
                                  value: valuefirst,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      valuefirst = value!;
                                    });
                                  }),
                              RichText(
                                  text: TextSpan(
                                      text: 'Agree to our',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade500))),
                              RichText(
                                  text: const TextSpan(
                                      text: ' Terms',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffD67AEA)))),
                              RichText(
                                  text: TextSpan(
                                      text: ' and',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey.shade500))),
                              RichText(
                                  text: const TextSpan(
                                      text: ' Conditions',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xffD67AEA)))),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VerificationScreen()));
                            },
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
                                  'Get Verification Code',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            width: 250,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    'Login With',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 16),
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 40, right: 40),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(0, 8),
                                              blurRadius: 5,
                                              color: Colors.black12),
                                        ],
                                      ),
                                      child: const Icon(
                                        Icons.apple,
                                        size: 45,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Apple',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 8),
                                              blurRadius: 5,
                                              color: Colors.black12,
                                            ),
                                          ]),
                                      child: const Icon(
                                        Icons.facebook_rounded,
                                        size: 45,
                                        color: Color(0xFF4285F4),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Facebook',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 8),
                                              blurRadius: 5,
                                              color: Colors.black12,
                                            ),
                                          ]),
                                      child: const Center(
                                        child: Icon(
                                          FontAwesomeIcons.google,
                                          size: 25,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Google',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          Container(
                            width: double.maxFinite,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.purpleAccent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => TryForFree()));
                                },
                                child: ShaderMask(
                                  shaderCallback: (bounds) =>
                                      const LinearGradient(
                                    colors: [
                                      Color(0xffFD4E86),
                                      Color(0xffD67BEC)
                                    ], // Gradient colors
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(bounds),
                                  child: const Text(
                                    'Skip Signup',
                                    style: TextStyle(
                                      fontSize: 20, // Adjust the font size
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .white, // This will be replaced by the gradient
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
