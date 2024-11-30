import 'package:flutter/material.dart';

class Connecting extends StatefulWidget {
  const Connecting({super.key});

  @override
  State<Connecting> createState() => _ConnectingState();
}

class _ConnectingState extends State<Connecting> {

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
              child: Image.asset('assets/background.png', fit: BoxFit.cover,),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: Image.asset('assets/asocial_1.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.person, size: 100, color: Colors.grey,),
                      ),
                    ),
                    Text('Katherine', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Text('Connecting', style: TextStyle(fontSize: 30, color: Colors.white),),
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
