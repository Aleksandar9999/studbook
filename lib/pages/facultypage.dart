import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/widgets/faculty.dart';
import 'package:student_connection/widgets/StudyProgram.dart';
import 'package:student_connection/pages/UseFulLinkPage.dart';

class FacultyPage extends StatefulWidget {
  FacultyPage({this.faculty});
  final Faculty faculty;
  @override
  _FacultyPageState createState() => _FacultyPageState(this.faculty);
}

class _FacultyPageState extends State<FacultyPage> {
  Faculty _faculty;
  _FacultyPageState(this._faculty);
  List<StudyProgram> komentari;
  DefaultTabController controller;

  @override
  void initState() {
    super.initState();
    komentari = [];
    komentari.add(new StudyProgram(
      comment: "Arhitektura",
      mark: 1,
    ));
    komentari.add(new StudyProgram(
      comment: "Biomedicinski inzinjering",
      mark: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              bottom: TabBar(labelColor: Colors.black, tabs: [
                Tab(text: "Studentski\nprogrami"),
                Tab(text: "Korisni\nlinkovi"),
              ]),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                  color: Colors.white,
                  child: Text(
                    _faculty.nazivFakulteta,
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 30),
              child: TabBarView(children: [
                ListView(
                  children: komentari,
                ),
                UseFulLinkPage(),
              ]),
            )),
      ),
    );
  }
}
