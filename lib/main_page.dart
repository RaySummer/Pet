import 'package:flutter/material.dart';

import 'helper/index.dart';
import 'circle/index.dart';
import 'message/index.dart';
import 'my/index.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  PageController pageController;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: PageView(
            children: <Widget>[
              HelperIndexPage(),
              CircleIndexPage(),
              MessageIndexPage(),
              MyIndexPage()
            ],
            controller: pageController,
            onPageChanged: onPageChanged,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.bubble_chart,
                    color: Color(0xffB4EEB4),
                  ),
                title: Text(
                  '帮帮',
                  style: TextStyle(
                    color: Color(0xffB4EEB4),
                  ),
                ),
                backgroundColor: Color(0xffFFFFFF),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.filter_tilt_shift,
                    color: Color(0xffB4EEB4),
                  ),
                title: Text(
                    '圈子',
                  style: TextStyle(
                    color: Color(0xffB4EEB4),
                  ),
                ),
                backgroundColor: Color(0xffFFFFFF),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.forum,
                    color: Color(0xffB4EEB4),
                  ),
                title: Text('消息',
                  style: TextStyle(
                    color: Color(0xffB4EEB4),
                  ),
                ),
                backgroundColor: Color(0xffFFFFFF),

              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                    color: Color(0xffB4EEB4),
                  ),
                title: Text('我的',
                  style: TextStyle(
                    color: Color(0xffB4EEB4),
                  ),
                ),
                backgroundColor: Color(0xffFFFFFF),
              ),
            ],
            onTap: onTap,
            currentIndex: page,
          ),
        ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: this.page);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }

  void onCenterButton() {
    pageController.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}

