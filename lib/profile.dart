import 'package:asocial/view/onboarding_screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool status = false;

  // Google Sign Out  //
  Future<bool> signOutFromGoogle() async {
    try{
      await FirebaseAuth.instance.signOut();
      return true;
    } catch(_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1, 2),
                          blurRadius: 1,
                        )
                      ]),
                  child: Icon(Icons.drag_handle, color: Colors.pinkAccent),
                ),
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 45,
                  height: 45,
                ),
              ],
            ),
          ),
          SizedBox(height: 45),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Account', style: TextStyle( color: Colors.pinkAccent,fontSize: 30, fontWeight: FontWeight.bold),),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(Icons.keyboard_arrow_right, size: 35, color: Colors.pinkAccent,),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset('assets/profile.png', fit: BoxFit.fitHeight,),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Harry Parker', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    Text('+91 9856815253', style: TextStyle(fontSize: 16, color: Colors.grey),)
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white60,
                child: Icon(Icons.security, color: Colors.pinkAccent,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 150),
                child: Text('Blocked', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Icon(Icons.keyboard_arrow_right),
              )
            ],
          ),
          SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white60,
                child: Icon(Icons.interests, color: Colors.pinkAccent,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Text('Interest matching', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              ),
              FlutterSwitch(
                width: 80,
                  height: 35,
                  valueFontSize: 15,
                  toggleSize: 25,
                  borderRadius: 30,
                  padding: 5,
                  showOnOff: true,
                  value: status,
                  onToggle: (val) {
                setState(() {
                  status = val;
                });
              })
            ],
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: (){
              signOutFromGoogle();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
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
                  'Logout',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
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
                  'permanently delete account',
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
        ]),
      ),
    );
  }
}
