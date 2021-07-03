import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:student_connection/pages/SubjectPage.dart';
import 'package:student_connection/repository/StudyProgramsRepository.dart';

class Subject extends StatelessWidget {
  String nazivPredmeta;
  String idPredmeta;
  String godinaStudija;
  String semestar;
  double mark;
  Subject(
      {this.mark,
      this.semestar,
      this.nazivPredmeta,
      this.idPredmeta,
      this.godinaStudija});

  factory Subject.fromDocument(DocumentSnapshot doc) {
    return Subject(
      nazivPredmeta: doc['ime'],
      idPredmeta: doc['id'],
      godinaStudija: doc['godina'],
      semestar: doc['semestar'],
      mark: 2,
    );
  }

  otvoriPredmet(context) {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = Offset(0.0, 1.0);
              var end = Offset.zero;
              var tween = Tween(begin: begin, end: end);
              var offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            },
            pageBuilder: (context, animation, secAnimation) {
              return SubjectPage(
                  idPredmeta: idPredmeta, nameSubject: nazivPredmeta);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => otvoriPredmet(context),
      child: Container(
        margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        width: MediaQuery.of(context).size.width,
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(nazivPredmeta,
                  overflow: TextOverflow.ellipsis, maxLines: 3),
            )),
            RatingBar.builder(
              initialRating: this.mark as double,
              itemSize: 20,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ignoreGestures: true,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
