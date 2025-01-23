import 'package:asocial/account_created.dart';
import 'package:asocial/models/interest_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  int activeStep = 3;
  final PageController _pageController = PageController(initialPage: 3);
  final TextEditingController _interestController = TextEditingController();

  final Map<String, Set<int>> selectedIndicesByCategory = {};
  final List<String> userInterest = [];

  // Set<int> selectedCreativityIndices = {};
  // Set<int> selectedSportsIndices = {};
  // Set<int> selectedGoingOutIndices = {};
  // Set<int> selectedFilmTvIndices = {};
  // Set<int> selectedOwmInterestIndices = {};

  // List<String> Creativity = [
  //   'Art', 'Design', 'Makeup', 'Photography', 'Writing', 'Singing', 'Dancing', 'Crafts',
  // ];
  //
  // List<String> Sports = [
  //   'Yoga', 'Running', 'Gym', 'Football', 'Cricket', 'Tennis',
  // ];
  //
  // List<String> GoingOut = [
  //   'Pubs', 'Festivals', 'Makeup', 'Photography', 'Writing', 'Singing', 'Dancing', 'Festivals',
  // ];
  //
  // List<String> Filmtv = [
  //   'Art', 'Design', 'Comedy', 'Photography', 'Writing', 'Singing',
  // ];
  //
  // List<String> OwnInterest = [
  //   'Reading', 'Racing',
  // ];

  final dio = Dio();
  InterestData data = InterestData();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      isLoading = true;
      Response response =
          await dio.get('https://api.asocial.chat/api/v1/auth/intrests-list');
      if (response.statusCode == 200) {
        data = InterestData.fromJson(response.data);
        setState(() {
          isLoading = false;
        });
        print(data.toJson());
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print(e);
    }
  }

  void _addInterest() async {
    if (_interestController.text.isNotEmpty) {
      setState(() {
        userInterest.add(_interestController.text);
        _interestController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Interests',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              'Pick up to 5 things you love',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 30),
            Expanded(
              child: data.body == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: data.body?.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        selectedIndicesByCategory.putIfAbsent(
                            data.body?[index].name ?? "", () => {});
                        return _buildCategorySection(
                            data.body?[index].name ?? "",
                            index == ((data.body?.length ?? 0) - 1)
                                ? userInterest
                                : data.body?[index].intrestList
                                        ?.map(
                                          (e) => e.name.toString(),
                                        )
                                        .toList() ??
                                    [],
                            selectedIndicesByCategory[
                                data.body?[index].name ?? ""]!);
                      },
                    ),
            ),
            Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'OR',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ))
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.maxFinite,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.purpleAccent, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Padding(
                            padding: MediaQuery.of(context).viewInsets,
                            child: Container(
                                padding: EdgeInsets.all(20),
                                width: double.maxFinite,
                                height: 200.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Enter your own',
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20.h),
                                    TextFormField(
                                      controller: _interestController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: 'Type your own interest here',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30.h),
                                    GestureDetector(
                                      onTap: () {
                                        if (_interestController.text
                                            .trim()
                                            .isNotEmpty) {
                                          userInterest.add(
                                              _interestController.text.trim());
                                          setState(() {});
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Container(
                                        width: double.maxFinite,
                                        height: 40.h,
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
                                )),
                          );
                        });
                  },
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xffFD4E86),
                        Color(0xffD67BEC)
                      ], // Gradient colors
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ).createShader(bounds),
                    child: const Text(
                      'Enter Your Own',
                      style: TextStyle(
                        fontSize: 20, // Adjust the font size
                        fontWeight: FontWeight.bold,
                        color: Colors
                            .white, // This will be replaced by the gradient
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountCreated()));
              },
              child: Container(
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    'Next',
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
      ),
    );
  }

  Widget _buildCategorySection(
      String title, List<String> items, Set<int> selectedIndices) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF403C3E),
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Wrap(
          spacing: screenWidth * 0.03,
          runSpacing: screenWidth * 0.05,
          children: List.generate(
            items.length,
            (index) => ChoiceChipItem2(
              label2: items[index],
              isSelected2: selectedIndices.contains(index),
              onSelected2: (isSelected) {
                setState(() {
                  if (isSelected) {
                    selectedIndices.add(index);
                  } else {
                    selectedIndices.remove(index);
                  }
                });
              },
            ),
          ).toList(),
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

class ChoiceChipItem2 extends StatelessWidget {
  final String label2;
  final bool isSelected2;
  final Function(bool) onSelected2;

  const ChoiceChipItem2({
    Key? key,
    required this.label2,
    required this.isSelected2,
    required this.onSelected2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return GestureDetector(
      onTap: () => onSelected2(!isSelected2),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.006, horizontal: screenWidth * 0.06),
        decoration: BoxDecoration(
          gradient: isSelected2
              ? LinearGradient(
                  colors: [Color(0xffFD4E86), Color(0xffD67BEC)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          label2,
          style: TextStyle(
            color: isSelected2 ? Colors.white : Color(0xFFA8A8A8),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
