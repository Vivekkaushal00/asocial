import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  int selectedAvatarIndex = -1;

  final List<String> avatars = [
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    'assets/Avatar.png',
    // Add more avatar paths as needed
  ];

  String? pickedImagepath;

  int activeStep = 2;
  final PageController _pageController = PageController(initialPage: 2);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Avatar',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "Select the avatar you like",
                style: TextStyle(
                    fontSize: 18, color: Colors.grey),
              ),
              Container(
                height: 470,
                width: double.maxFinite,
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: avatars.length + 1,
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () async {
                          final source =
                          await showModalBottomSheet<
                              ImageSource>(
                              context: context,
                              builder:
                                  (BuildContext context) {
                                return Container(
                                  padding:
                                  EdgeInsets.all(16),
                                  height: 150,
                                  child: Column(
                                    mainAxisSize:
                                    MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Choose Image Source',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                      SizedBox(
                                          height: 10),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          TextButton.icon(
                                              onPressed:
                                                  () {
                                                Navigator.pop(
                                                    context,
                                                    ImageSource
                                                        .camera);
                                              },
                                              icon: Icon(
                                                Icons
                                                    .camera_alt,
                                                size: 40,
                                              ),
                                              label: Text(
                                                  'Camera')),
                                          TextButton.icon(
                                              onPressed:
                                                  () {
                                                Navigator.pop(
                                                    context,
                                                    ImageSource
                                                        .gallery);
                                              },
                                              icon: Icon(
                                                  Icons
                                                      .photo_library,
                                                  size:
                                                  40),
                                              label: Text(
                                                  'Gallery'))
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              });
                          if (source != null) {
                            final XFile? pickedImage =
                            await ImagePicker().pickImage(
                                source: source);
                            if (pickedImage != null) {
                              setState(() {
                                pickedImagepath =
                                    pickedImage.path;
                              });
                            }
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              border: Border.all(
                                  color: Colors.grey),
                              borderRadius:
                              BorderRadius.circular(10)),
                          child: pickedImagepath != null
                              ? Image.file(
                              File(pickedImagepath!))
                              : Icon(Icons.add_a_photo,
                              size: 40),
                        ),
                      );
                    } else {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAvatarIndex = index - 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedAvatarIndex ==
                                  (index - 1)
                                  ? Colors.pink
                                  : Colors.transparent,
                              width: 2,
                            ),
                            borderRadius:
                            BorderRadius.circular(10),
                          ),
                          child:
                          Image.asset(avatars[index - 1]),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 40),
              Column(
                children: [
                  Container(
                    width: double.maxFinite,
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
                      borderRadius:
                      BorderRadius.circular(20),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
