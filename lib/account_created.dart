import 'package:asocial/home.dart';
import 'package:flutter/material.dart';

class AccountCreated extends StatefulWidget {
  const AccountCreated({super.key});

  @override
  State<AccountCreated> createState() => _AccountCreatedState();
}

class _AccountCreatedState extends State<AccountCreated> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(
                    color: Colors.black12,
                    offset: Offset(3, 6),
                    blurRadius: 5
                  ),],
                ),
                child: Icon(Icons.arrow_back),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 300,
                    child: Image.asset('assets/account.png'),
                  ),
                  Text('Account Created', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20),
                  Text('Dear user your account has been created \n successfully.Continue to start using App.', style: TextStyle(fontSize: 20, color: Colors.grey),),
                  SizedBox(height: 150),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: Container(
                      width: 390,
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
            )
          ],
        ),
      ),
    );
  }
}
