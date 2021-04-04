import 'package:flutter/cupertino.dart';
import 'package:student_connection/mv/comment.dart';

class CommentsPage extends StatefulWidget {
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
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
    return ListView(
      children: komentari,
    );
  }
}
