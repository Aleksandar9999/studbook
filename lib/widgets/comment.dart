import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Comment extends StatefulWidget {
  String comment;
  int mark;
  Comment({this.comment, this.mark});

  factory Comment.fromDocument(DocumentSnapshot doc) {
    return Comment(
      comment: doc['comment'],
      mark: doc['mark'],
    );
  }
  @override
  _CommentState createState() => _CommentState(this.comment, this.mark);
}

class _CommentState extends State<Comment> {
  String comment;
  bool clicked = false;
  int mark;
  _CommentState(comm, mm) {
    this.comment = comm;
    this.mark = mm;
  }
  otvoriKomentar() {
    setState(() {
      clicked = !clicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: otvoriKomentar,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.elasticOut,
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
        height: clicked ? 180 : 90,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(comment,
                  overflow: TextOverflow.ellipsis, maxLines: clicked ? 13 : 3),
            )),
            RatingBar.builder(
              initialRating: mark.toDouble(),
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
