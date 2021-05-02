import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/model/user.dart';
import 'package:student_connection/pages/scriptsPage.dart';
import 'package:student_connection/repository/studyprograms.dart';
import 'package:student_connection/widgets/comment.dart';
import 'package:student_connection/widgets/study_program.dart';
import 'package:student_connection/pages/useFulLinkPage.dart';

class SubjectPage extends StatefulWidget {
  String idPredmeta;
  String nameSubject;
  SubjectPage({this.idPredmeta, this.nameSubject});
  @override
  _SubjectPageState createState() =>
      _SubjectPageState(idSubject: this.idPredmeta, nameSubject: nameSubject);
}

class _SubjectPageState extends State<SubjectPage> {
  List<Comment> komentari = [];
  String idSubject;
  String nameSubject;
  _SubjectPageState({this.idSubject, this.nameSubject});
  bool done = false;
  @override
  void initState() {
    gett();
    super.initState();
  }

  gett() async {
    await GetSubjectComments(idSubject);
    setState(() {
      done = true;
    });
  }

  getTab() {
    if (loggedInUser != null) return Tab(text: "Skripte");
  }

  getView() {
    if (loggedInUser != null)
      return ScriptsPage(
        idSubject: this.idSubject,
      );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: loggedInUser != null ? 3 : 2,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              bottom: TabBar(labelColor: Colors.black, tabs: [
                Tab(
                  text: "Komentari",
                ),
                Tab(text: "Korisni\nlinkovi"),
                getTab()
              ]),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                  color: Colors.white,
                  child: Text(
                    nameSubject,
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 30),
              child: TabBarView(children: [
                done
                    ? ListView(
                        children: listComment,
                      )
                    : Text(""),
                UseFulLinkPage(idSubject: this.idSubject),
                getView()
              ]),
            )),
      ),
    );
  }
}
