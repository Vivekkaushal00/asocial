import 'package:asocial/account_created.dart';
import 'package:asocial/view/onboarding_screens/login_screen.dart';
import 'package:flutter/material.dart';

class TryForFree extends StatefulWidget {
  const TryForFree({super.key});

  @override
  State<TryForFree> createState() => _TryForFreeState();
}

class _TryForFreeState extends State<TryForFree> {
  String selectedGender = '';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: screenWidth,
              height: screenHeight,
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Try For Free',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Enter your details',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  width: screenWidth,
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(100)),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 80, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 5, right: 10),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 0.5,
                                              color: Colors.grey.shade300))),
                                  child: Icon(Icons.person)),
                            ),
                            hintText: 'Screen name/nickname',
                            hintStyle: TextStyle(
                                fontSize: 18, color: Colors.grey.shade300),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                        Text(
                          'Gender',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 40),
                        GridView.builder(
                            padding: EdgeInsets.zero,
                            physics: ScrollPhysics(),
                            itemCount: genderOptions.length,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1),
                            itemBuilder: (context, index) {
                              return buildGenderOption(
                                icon: genderOptions[index]['icon'],
                                label: genderOptions[index]['label'],
                                gender: genderOptions[index]['gender'],
                              );
                            }),
                        SizedBox(height: 100),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AccountCreated()));
                          },
                          child: Container(
                            width: screenWidth,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Gender Selection Widget
  Widget buildGenderOption({required icon, required label, required gender}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectedGender == gender
                        ? Colors.pinkAccent
                        : Colors.grey.shade50,
                    width: 2),
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade100),
            child: Icon(
              icon,
              size: 60,
              color: Colors.pinkAccent,
            ),
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
