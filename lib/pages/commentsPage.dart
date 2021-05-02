import 'package:flutter/cupertino.dart';
import 'package:student_connection/repository/studyprograms.dart';
import 'package:student_connection/widgets/comment.dart';

class CommentsPage extends StatefulWidget {
  String idSubject;
  CommentsPage(String id) {
    this.idSubject = id;
  }
  @override
  _CommentsPageState createState() => _CommentsPageState(this.idSubject);
}

class _CommentsPageState extends State<CommentsPage> {
  List<Comment> komentari = [];
  String idSubject;
  _CommentsPageState(String id) {
    this.idSubject = id;
  }
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

  @override
  Widget build(BuildContext context) {
    return done
        ? ListView(
            children: listComment,
          )
        : Text("");
  }
}
