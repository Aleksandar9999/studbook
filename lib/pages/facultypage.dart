import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/mv/faculty.dart';
import 'package:student_connection/widgets/header.dart';

class FacultyPage extends StatefulWidget {
  @override
  _FacultyPageState createState() => _FacultyPageState();
}

class _FacultyPageState extends State<FacultyPage> {
  List<Faculty> fakulteti = [];
  @override
  void initState() {
    super.initState();
    fakulteti.add(Faculty(
      nazivFakulteta: "Fakultet tehničkih nauka",
      grad: "Novi Sad",
      urlLogo:
          "https://seeklogo.com/images/F/Fakultet_tehnickih_nauka_-_Novi_Sad-logo-C11C616640-seeklogo.com.png",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Prirodno-matematički fakultet",
      grad: "Novi Sad",
      urlLogo:
          "https://www.pmf.uns.ac.rs/wp-content/uploads/2016/01/cropped-pmf-1.png",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Fakultet sporta i fizičkog vaspitanja",
      grad: "Novi Sad",
      urlLogo:
          "https://www.najstudent.com/public/files/organization/organization_843/fakultet-sporta-i-fizickog-vaspitanja-logo.jpg",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Fakultet tehničkih nauka",
      grad: "Novi Sad",
      urlLogo:
          "https://seeklogo.com/images/F/Fakultet_tehnickih_nauka_-_Novi_Sad-logo-C11C616640-seeklogo.com.png",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Prirodno-matematički fakultet",
      grad: "Novi Sad",
      urlLogo:
          "https://www.pmf.uns.ac.rs/wp-content/uploads/2016/01/cropped-pmf-1.png",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Fakultet sporta i fizičkog vaspitanja",
      grad: "Novi Sad",
      urlLogo:
          "https://www.najstudent.com/public/files/organization/organization_843/fakultet-sporta-i-fizickog-vaspitanja-logo.jpg",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Fakultet tehničkih nauka",
      grad: "Novi Sad",
      urlLogo:
          "https://seeklogo.com/images/F/Fakultet_tehnickih_nauka_-_Novi_Sad-logo-C11C616640-seeklogo.com.png",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Prirodno-matematički fakultet",
      grad: "Novi Sad",
      urlLogo:
          "https://www.pmf.uns.ac.rs/wp-content/uploads/2016/01/cropped-pmf-1.png",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Fakultet sporta i fizičkog vaspitanja",
      grad: "Novi Sad",
      urlLogo:
          "https://www.najstudent.com/public/files/organization/organization_843/fakultet-sporta-i-fizickog-vaspitanja-logo.jpg",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Fakultet tehničkih nauka",
      grad: "Novi Sad",
      urlLogo:
          "https://seeklogo.com/images/F/Fakultet_tehnickih_nauka_-_Novi_Sad-logo-C11C616640-seeklogo.com.png",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Prirodno-matematički fakultet",
      grad: "Novi Sad",
      urlLogo:
          "https://www.pmf.uns.ac.rs/wp-content/uploads/2016/01/cropped-pmf-1.png",
    ));
    fakulteti.add(Faculty(
      nazivFakulteta: "Fakultet sporta i fizičkog vaspitanja",
      grad: "Novi Sad",
      urlLogo:
          "https://www.najstudent.com/public/files/organization/organization_843/fakultet-sporta-i-fizickog-vaspitanja-logo.jpg",
    ));
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
