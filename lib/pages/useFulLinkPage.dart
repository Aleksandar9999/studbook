import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/repository/StudyProgramsRepository.dart';
import 'package:student_connection/widgets/header.dart';
import '../widgets/UsefulLink.dart';

class UseFulLinkPage extends StatefulWidget {
  String idSubject;
  UseFulLinkPage({this.idSubject});
  @override
  _UseFulLinkPageState createState() =>
      _UseFulLinkPageState(idSubject: this.idSubject);
}

class _UseFulLinkPageState extends State<UseFulLinkPage> {
  String idSubject;
  _UseFulLinkPageState({this.idSubject});
  List<UseFullLink> linkovi = [];
  bool done = false;
  @override
  void initState() {
    gett();
    super.initState();
  }

  gett() async {
    await getSubjectUseFullLinks(this.idSubject);
    setState(() {
      done = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return done
        ? ListView(
            children: listUsefullLinks,
          )
        : Text("");
  }
}
