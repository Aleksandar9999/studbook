import 'package:flutter/cupertino.dart';

class ScriptsPage extends StatefulWidget {
  String idSubject;
  ScriptsPage({this.idSubject});
  @override
  _ScriptsPageState createState() =>
      _ScriptsPageState(idSubject: this.idSubject);
}

class _ScriptsPageState extends State<ScriptsPage> {
  String idSubject;
  _ScriptsPageState({this.idSubject});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
