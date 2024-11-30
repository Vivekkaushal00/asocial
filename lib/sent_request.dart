import 'package:flutter/material.dart';

class SentRequest extends StatefulWidget {
  const SentRequest({super.key});

  @override
  State<SentRequest> createState() => _SentRequestState();
}

class _SentRequestState extends State<SentRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1, 2),
                          blurRadius: 1,
                        )]
                      ),
                      child: Icon(Icons.drag_handle, color: Colors.pinkAccent),
                    ),
                    Text('Sent Request', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(width: 45, height: 45,)
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
                  contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 100),
              Image.asset('assets/no_data.png'),
              SizedBox(height: 30),
              Text('No Data Found' , style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w500),)
            ],
          ),
        ),
      ),
    );
  }
}
