import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/dialogs/addNewCommentDialog.dart';
import 'package:student_connection/dialogs/addNewUseFullLinkDialog.dart';
import 'package:student_connection/model/User.dart';
import 'package:student_connection/pages/CommentsPage.dart';
import 'package:student_connection/pages/ScriptsPage.dart';
import 'package:student_connection/repository/StudyProgramsRepository.dart';
import 'package:student_connection/widgets/comment.dart';
import 'package:student_connection/widgets/StudyProgram.dart';
import 'UseFulLinkPage.dart';

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
    super.initState();
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

  int tabIndex = 0;
  floatingButtonClicked() {
    print(tabIndex);
    if (tabIndex == 0)
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(height: 150, child: AddNewCommentDialog());
          });
    else if (tabIndex == 1) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AddNewUseFullLinkDialog();
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: loggedInUser != null ? 3 : 2,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context);
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            if (mounted)
              setState(() {
                tabIndex = tabController.index;
              });
          }
        });

        return SafeArea(
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
              CommentsPage(idSubject),
              UseFulLinkPage(idSubject: this.idSubject),
              getView()
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () => floatingButtonClicked(),
            backgroundColor: Theme.of(context).primaryColor,
          ),
        ));
      }),
    );
  }
}
