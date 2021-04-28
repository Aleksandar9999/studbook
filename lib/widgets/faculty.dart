import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/pages/facultyBook.dart';

class Faculty extends StatelessWidget {
  String nazivFakulteta;
  String idFakulteta;
  String grad;
  String urlLogo;
  String photoUrl;
  Faculty(
      {this.idFakulteta,
      this.nazivFakulteta,
      this.urlLogo,
      this.grad,
      this.photoUrl});
  openFaculty(context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (context, animation, secanimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.ease);
              return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.topRight,
                  child: child);
            },
            pageBuilder: (context, animation, secAnimation) {
              return FacultyBook(faks: this);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
      child: GestureDetector(
        onTap: () => openFaculty(context),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          height: 80,
          child: Center(
              child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(left: 5),
                child: Image.network(urlLogo),
              ),
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(left: 15, top: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nazivFakulteta,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        grad,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey[800]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
