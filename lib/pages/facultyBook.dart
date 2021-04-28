import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/widgets/comment.dart';
import 'package:student_connection/widgets/faculty.dart';
import 'package:student_connection/widgets/study_program.dart';
import 'package:student_connection/pages/useFulLinkPage.dart';

class FacultyBook extends StatefulWidget {
  FacultyBook({this.faks});
  Faculty faks;
  @override
  _FacultyBookState createState() => _FacultyBookState(faks: this.faks);
}

class _FacultyBookState extends State<FacultyBook> {
  Faculty faks;
  _FacultyBookState({this.faks});
  List<StudyProgram> komentari;
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
    //controller=new TabController(length: 3, vsync: )
  }

  DefaultTabController controller;

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
                Tab(
                  text: "Studentski\nprogrami",
                ),
                Tab(text: "Korisni\nlinkovi"),
              ]),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                  color: Colors.white,
                  child: Text(
                    faks.nazivFakulteta,
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
