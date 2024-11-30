import 'package:asocial/page_1.dart';
import 'package:asocial/page_2.dart';
import 'package:asocial/page_3.dart';
import 'package:asocial/page_4.dart';
import 'package:asocial/verification_screen.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  int activeStep = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(height: 20),
                EasyStepper(
                  onStepReached: (index) {
                    setState(() {
                      activeStep = index;
                    });
                  },
                  showLoadingAnimation: false,
                  showStepBorder: false,
                  finishedStepBackgroundColor: Colors.transparent,
                  finishedStepBorderColor: Colors.white,
                  internalPadding: 10,
                  activeStep: activeStep,
                  lineStyle: LineStyle(
                      defaultLineColor: Colors.white,
                      lineSpace: 3,
                      lineType: LineType.dashed),
                  stepRadius: 25,
                  steps: [
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Text("1"),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Text("2"),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Text("3"),
                      ),
                    ),
                    EasyStep(
                      customStep: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Text("4"),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                    ),
                  ),
                  child: PageView(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                        child: PageView(
                          controller: _pageController,
                          children: [
                            Page1(),
                            Page2(),
                            Page3(),
                            Page4()
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
