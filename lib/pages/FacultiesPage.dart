import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/widgets/faculty.dart';
import 'package:student_connection/widgets/header.dart';

class FacultiesPage extends StatefulWidget {
  @override
  _FacultiesPageState createState() => _FacultiesPageState();
}

class _FacultiesPageState extends State<FacultiesPage> {
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
