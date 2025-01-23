import 'package:asocial/chat_history.dart';
import 'package:asocial/friends.dart';
import 'package:asocial/view/onboarding_screens/login_screen.dart';
import 'package:asocial/messages.dart';
import 'package:asocial/profile.dart';
import 'package:asocial/sent_Request1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool status = false;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(child: Image.asset('assets/asocial.png')),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  _key.currentState!.closeDrawer();
                },
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.people,
                  color: Colors.white,
                ),
                title:
                    Text('My Asocial', style: TextStyle(color: Colors.white)),
                children: [
                  ListTile(
                    title: Text('Sent Request',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SentRequest1()));
                    },
                  ),
                  ListTile(
                    title:
                        Text('Friends', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Friends()));
                    },
                  ),
                  ListTile(
                    title:
                        Text('Messages', style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Messages()));
                    },
                  ),
                  ListTile(
                    title: Text('Chat History',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatHistory()));
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(
                  Icons.account_circle,
                  color: Colors.white,
                ),
                title: Text('Profile', style: TextStyle(color: Colors.white)),
                children: [
                  ListTile(
                    title: Text('My Account',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));
                    },
                  ),
                ],
              ),
              ExpansionTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings', style: TextStyle(color: Colors.white)),
                children: [
                  ListTile(
                    title: Text('Privacy Policy',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Terms & Conditions',
                        style: TextStyle(color: Colors.white)),
                    onTap: () {},
                  ),
                ],
              ),
              Divider(color: Colors.white),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          GestureDetector(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Container(
                width: double.maxFinite,
                height: 80,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(Icons.drag_handle),
                    ),
                    SizedBox(width: 200),
                    FlutterSwitch(
                        width: 60,
                        valueFontSize: 12,
                        showOnOff: true,
                        padding: 5,
                        value: status,
                        onToggle: (val) {
                          setState(() {
                            status = val;
                          });
                        }),
                    Icon(
                      Icons.info_outline,
                      size: 30,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 800),
            child: Container(
              width: double.maxFinite,
              height: 80,
              // color: Colors.white,
              child: Row(
                children: [
                  Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      gradient: LinearGradient(
                        colors: [Colors.pinkAccent, Colors.purpleAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.videocam, color: Colors.white, size: 40),
                        SizedBox(width: 8),
                        Text(
                          'Start video call',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 15),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.flip_camera_ios_sharp, color: Colors.pinkAccent, size: 35,),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
