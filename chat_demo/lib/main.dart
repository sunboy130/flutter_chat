import 'package:chat_demo/sign_up.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GuidePage(),
    );
  }
}

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  final List<String> imageArr = [
    "assets/images/Group.png",
    "assets/images/Group.png",
    "assets/images/Group.png",
  ];

  final List<String> progressArr = [
    "assets/images/Progress.png",
    "assets/images/Progress1.png",
    "assets/images/Progress2.png",
  ];

  final List<String> titles = [
    "Introduction to Chatbot_AI",
    "Explore categories of all topics",
    "Getting started with chatbot_AI",
  ];

  final List<String> descriptions = [
    "Meet Chatbot, your personal AI language model & discover the benefits of using Chatbot_AI for language tasks",
    "Ask questions to chatbot_AI with the help of different categories and get answers that you want.",
    "Try out different language tasks and modes.",
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.21, -0.98),
                end: Alignment(-0.21, 0.98),
                colors: [Color(0xFF16C3CE), Color(0xFF16C3CE), Color(0xFF01959F)],
              ),
            )
          ),
          PageView.builder(
            itemCount: imageArr.length,
            controller: PageController(),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: Image.asset(imageArr[index]).image,
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 32,right: 32),
                        child: Text(
                          titles[_currentIndex],
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const  EdgeInsets.only(left: 32,right: 32),
                        child: Text(
                          descriptions[_currentIndex],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              );
            },
          ),
          Positioned(
            top: 30,
            right: 30,
            child: _currentIndex < imageArr.length - 1
                ? TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RegisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : SizedBox(), // 如果在第三张页面，隐藏"Skip"按钮
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: IconButton(
              iconSize: 80,
              icon: Image.asset(progressArr[_currentIndex]),
              onPressed: () {
                if (_currentIndex < imageArr.length - 1) {
                  // 如果不是最后一页，切换到下一页
                  setState(() {
                    _currentIndex++;
                  });
                } else {
                  // 如果是最后一页，导航到RegisterPage
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RegisterPage(),
                    ),
                  );
                }
              },
            )
          ),
          Positioned(
            left: 30,
            bottom: 70,
            child: Row(
              children: List.generate(imageArr.length, (index) {
                return Container(
                  width: index == _currentIndex ? 25 : 8,
                  height: 8,
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
