import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/model/User.dart';
import 'package:student_connection/repository/StudyProgramsRepository.dart';
import 'package:student_connection/repository/UsersRepository.dart';
import 'package:student_connection/widgets/header.dart';
import '../widgets/Subject.dart';

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
    await getSubjects(loggedInUser.studyProgramId);
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
