import 'package:flutter/material.dart';

class Blocked extends StatefulWidget {
  const Blocked({super.key});

  @override
  State<Blocked> createState() => _BlockedState();
}

class _BlockedState extends State<Blocked> {
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
                  child: Icon(Icons.arrow_back, color: Colors.pinkAccent),
                ),
                Text(
                  'Blocked',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 45,
                  height: 45,
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Search Here',
              hintStyle: TextStyle(color: Colors.grey),
              suffixIcon: Icon(Icons.search, color: Colors.pinkAccent),
              contentPadding:
              EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            width: double.maxFinite,
            height: 700,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 15,
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
                            Padding(
                              padding: const EdgeInsets.only(right: 100),
                              child: Text(
                                'Jesse Cooper',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffFD4E86),
                                      Color(0xffD67BEC),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: Center(
                                  child: Text(
                                    'Blocked',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 15),
                                  )),
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
