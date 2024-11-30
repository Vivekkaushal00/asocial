import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
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
                  'Messages',
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
          SizedBox(height: 20),
          Container(
            width: double.maxFinite,
            height: 700,
            child: PageView(physics: NeverScrollableScrollPhysics(), children: [
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
                          backgroundImage: AssetImage('assets/Avatar.png'),
                          radius: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 150),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                'Riya Roy',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Hi, How are you?',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 10),
                            Text(
                              '11:20 PM',
                              style: TextStyle(fontSize: 15, color: Colors.black54),
                            ),
                            SizedBox(height: 15),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.pinkAccent,
                              child: Text(
                                '5',
                                style: TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ]),
          )
        ]),
      ),
    );
  }
}
