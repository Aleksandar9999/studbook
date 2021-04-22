import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/mv/comment.dart';
import 'package:student_connection/mv/study_program.dart';
import 'package:student_connection/pages/useFulLinkPage.dart';

class SubjectPage extends StatefulWidget {
  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  List<Comment> komentari = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    komentari.add(Comment(
      comment: "Mnogo zanimvljiv i korisan predmet.",
      mark: 3,
    ));
    komentari.add(Comment(
      comment: "Mnogo zanimvljiv i korisan predmet.",
      mark: 3,
    ));
    komentari.add(Comment(
      comment: "Mnogo zanimvljiv i korisan predmet.",
      mark: 3,
    ));
    komentari.add(Comment(
      comment:
          ".Mnogo zanimvljiv i korisan predmet.Mnogo zanimvljiv i korisan predmetvMnogo zanimvljiv i korisan predmet.Mnogo zanimvljiv i korisan predmetMnogo zanimvljiv i korisan predmet.Mnogo zanimvljiv i korisan predmet.Mnogo zanimvljiv i korisan predmet.",
      mark: 3,
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
                Tab(
                  text: "Komentari",
                ),
                Tab(text: "Korisni\nlinkovi"),
              ]),
              backgroundColor: Colors.white,
              elevation: 0,
              title: Container(
                  color: Colors.white,
                  child: Text(
                    "Naziv predmeta",
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
