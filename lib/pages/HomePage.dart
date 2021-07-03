import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/pages/ProfilePage.dart';
import 'package:student_connection/pages/SubjectsPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int pageIndex = 0;
  onPageChange(int index) {
    setState(() {
      this.pageIndex = index;
    });
  }

  onTap(int pageIndex) {
    pageController.jumpToPage(pageIndex);
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          children: <Widget>[SubjectsPage(), Profile()],
          onPageChanged: onPageChange,
          controller: pageController,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: "")
          ],
        ),
      ),
    );
  }
}
