import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/pages/commentsPage.dart';
import 'package:student_connection/pages/subjectspage.dart';
import 'package:student_connection/pages/useFulLinkPage.dart';

class StudentProgramPage extends StatefulWidget {
  @override
  _StudentProgramPageState createState() => _StudentProgramPageState();
}

class _StudentProgramPageState extends State<StudentProgramPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              bottom: TabBar(labelColor: Colors.black, tabs: [
                Tab(
                  text: "Predmeti",
                ),
                Tab(text: "Komentari"),
                Tab(text: "Korisni\nlinkovi"),
              ]),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                  color: Colors.white,
                  child: Text(
                    "Arhitektura",
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 30),
              child: TabBarView(children: [
                SubjectsPage(),
                CommentsPage(),
                UseFulLinkPage(),
              ]),
            )),
      ),
    );
  }
}
