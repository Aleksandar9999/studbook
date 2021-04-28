import 'package:flutter/cupertino.dart';
import 'package:student_connection/widgets/usefullinks.dart';

class UseFulLinkPage extends StatefulWidget {
  @override
  _UseFulLinkPageState createState() => _UseFulLinkPageState();
}

class _UseFulLinkPageState extends State<UseFulLinkPage> {
  List<UseFulLinks> linkovi = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    linkovi.add(UseFulLinks(
      url: "http://www.ftn.uns.ac.rs/691618389/fakultet-tehnickih-nauka",
      naziv: "Zvanicna web stranica",
    ));
    linkovi.add(UseFulLinks(
      url: "http://www.ftn.uns.ac.rs/691618389/fakultet-tehnickih-nauka",
      naziv: "Facebook grupa za upis",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: linkovi,
    );
  }
}
