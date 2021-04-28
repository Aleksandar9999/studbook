import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/widgets/faculty.dart';
import 'package:student_connection/widgets/header.dart';

class FacultyPage extends StatefulWidget {
  @override
  _FacultyPageState createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  List<Faculty> fakulteti = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Header(),
          ),
          body: ListView(
            children: fakulteti,
          )),
    );
  }
}
