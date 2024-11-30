import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    'Friends',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                  )
                ],
              ),
            ),
            SizedBox(height: 30),
            ToggleSwitch(
              cornerRadius: 15,
              minWidth: 190,
              minHeight: 60,
              initialLabelIndex: 0,
              totalSwitches: 2,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.white,
              activeBgColors: [[Color(0xffFD4E86), Color(0xffD67BEC)], [Color(0xffFD4E86), Color(0xffD67BEC)]],
              labels: ['All Friends' , 'New Request'],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
            SizedBox(height: 20),
            Text('All Friends (25)' , style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              height: 650,
              child:
              PageView(physics: NeverScrollableScrollPhysics(), children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: 25,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage('assets/Avatar.png'),
                          ),
                          // SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 180),
                            child: Text(
                              'Danny Rice',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child:
                              Image.asset('assets/Vector.png')
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
