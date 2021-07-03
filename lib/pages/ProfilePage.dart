import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/model/User.dart';
import 'package:student_connection/repository/StudyProgramsRepository.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool done = false;
  @override
  void initState() {
    gett();
    super.initState();
    print(loggedInUser.name);
  }

  String studyProgram;
  gett() async {
    studyProgram = await getName(loggedInUser.studyProgramId);
    setState(() {
      done = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            loggedInUser.name + " " + loggedInUser.surname,
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            Text("Email: " + loggedInUser.email),
            Text("Fakultet: " + loggedInUser.faculty),
            Text("Studijski program: " + loggedInUser.studyProgram.nameProgram),
            Text("Pol: " + loggedInUser.gender),
            Text("Godina studija: " + loggedInUser.yearStudy),
            Text("Email: " + loggedInUser.email)
          ],
        ));
  }
}
