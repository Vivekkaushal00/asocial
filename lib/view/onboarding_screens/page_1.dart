import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int activeStep = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  'Your Screen Name',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      color: Colors.black),
                ),
              ),
              Text(
                'Enter Your Name',
                style:
                TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 5, right: 10),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 0.5,
                                      color: Colors
                                          .grey.shade300))),
                          child: Icon(Icons.person)),
                    ),
                    hintText: 'Screen name/nickname',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade300),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Text(
                  "Date of Birth",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Text(
                "You must be 18 or older to use Asocial",
                style:
                TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding:
                      EdgeInsets.only(left: 5, right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              width: 0.5,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        child: Icon(Icons.calendar_month),
                      ),
                    ),
                    hintText: "DD/MM/YYYY",
                    hintStyle: TextStyle(
                        color: Colors.grey.shade300,
                        fontSize: 18),
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
