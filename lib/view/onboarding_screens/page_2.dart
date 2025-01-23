import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int activeStep = 1;
  final PageController _pageController = PageController(initialPage: 1);

  String selectedGender = '';

  // List of genders to show in GridView
  List<Map<String, dynamic>> genderOptions = [
    {
      "icon": Icons.male,
      "label": "Male",
      "gender": "Male",
    },
    {
      "icon": Icons.female,
      "label": "Female",
      "gender": "Female",
    },
    {
      "icon": Icons.transgender,
      "label": "Non binary",
      "gender": "Non binary",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Gender',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
              Text(
                "Only One Chance to choose",
                style: TextStyle(
                    fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: ScrollPhysics(),
                      itemCount: genderOptions.length,
                      shrinkWrap: true,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1),
                      itemBuilder: (context, index) {
                        return buildGenderOption(
                            icon: genderOptions[index]
                            ['icon'],
                            label: genderOptions[index]
                            ['label'],
                            color: genderOptions[index]
                            ['color'],
                            gender: genderOptions[index]
                            ['gender']);
                      })
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
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
                        borderRadius:
                        BorderRadius.circular(20),
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
            ],
          ),
        ),
      ),
    );
  }


  // Gender Selection Widget
  Widget buildGenderOption(
      {required icon, required label, required color, required gender}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Column(
        children: [
          Container(
            width: 180,
            height: 150,
            // color: Colors.grey.shade600,
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectedGender == gender
                        ? Colors.pinkAccent
                        : Colors.grey,
                    width: 2),
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade50),
            child: Icon(icon,
                size: 80,
                color:
                selectedGender == gender ? Colors.pinkAccent : Colors.grey),
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
                fontSize: 18,
                color:
                selectedGender == gender ? Colors.pinkAccent : Colors.grey),
          ),
        ],
      ),
    );
  }
}
