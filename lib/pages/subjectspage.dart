import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/model/user.dart';
import 'package:student_connection/repository/studyprograms.dart';
import 'package:student_connection/repository/usersRepository.dart';
import 'package:student_connection/widgets/header.dart';
import 'package:student_connection/widgets/subject.dart';

class SubjectsPage extends StatefulWidget {
  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  List<Subject> predmeti;
  bool done = false;
  @override
  void initState() {
    gett();
    super.initState();
  }

  gett() async {
    await GetListSubjects(loggedInUser.studyProgramId);
    setState(() {
      done = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Header(),
      ),
      body: done == false
          ? Text("Waiting")
          : Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView(children: listSubjects),
            ),
    );
  }
}
