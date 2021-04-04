import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/mv/subject.dart';

class SubjectsPage extends StatefulWidget {
  @override
  _SubjectsPageState createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  List<Subject> predmeti;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    predmeti = [];
    predmeti.add(Subject(
      godinaStudija: "1",
      nazivPredmeta: "Arhitektura 1",
      sifraPredmeta: "1",
    ));
    predmeti.add(Subject(
      godinaStudija: "1",
      nazivPredmeta: "Arhitektura 2",
      sifraPredmeta: "2",
    ));
    predmeti.add(Subject(
      godinaStudija: "1",
      nazivPredmeta: "Arhitektura 3",
      sifraPredmeta: "3",
    ));
    predmeti.add(Subject(
      godinaStudija: "1",
      nazivPredmeta: "Arhitektura 4",
      sifraPredmeta: "4",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: predmeti,
    );
  }
}
