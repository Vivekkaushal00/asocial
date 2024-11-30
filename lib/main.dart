import 'dart:async';

import 'package:asocial/account_created.dart';
import 'package:asocial/blocked.dart';
import 'package:asocial/chat_history.dart';
import 'package:asocial/connecting.dart';
import 'package:asocial/friends.dart';
import 'package:asocial/home.dart';
import 'package:asocial/login_screen.dart';
import 'package:asocial/messages.dart';
import 'package:asocial/name_screen.dart';
import 'package:asocial/page_4.dart';
import 'package:asocial/profile.dart';
import 'package:asocial/sent_Request1.dart';
import 'package:asocial/sent_request.dart';
import 'package:asocial/splash_screen.dart';
import 'package:asocial/try_for_free.dart';
import 'package:asocial/verification_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
