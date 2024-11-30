import 'package:flutter/material.dart';

class SentRequest1 extends StatefulWidget {
  const SentRequest1({super.key});

  @override
  State<SentRequest1> createState() => _SentRequest1State();
}

class _SentRequest1State extends State<SentRequest1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
                    'Sent Request',
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
              child:
                  PageView(physics: NeverScrollableScrollPhysics(), children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
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
                          // SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.only(right: 80),
                            child: Text(
                              'Danny Rice',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                          // SizedBox(width: 90),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                                child: Text(
                              'Cancel',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            )),
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
