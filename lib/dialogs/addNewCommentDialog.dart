import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddNewCommentDialog extends StatefulWidget {
  @override
  _AddNewCommentDialogState createState() => _AddNewCommentDialogState();
}

class _AddNewCommentDialogState extends State<AddNewCommentDialog> {
  TextEditingController markController = new TextEditingController();
  double ratingStars;
  dodajKomentar() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: Colors.white,
      child: Container(
        height: 250,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  "DODAJ KOMENTAR",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: TextFormField(
                controller: markController,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  return null;
                },
                decoration: InputDecoration(hintText: "Komentar"),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                child: RatingBar.builder(
                  onRatingUpdate: (value) => {
                    setState(() {
                      ratingStars = value;
                    })
                  },
                  initialRating: 0,
                  itemSize: 20,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: dodajKomentar,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900], // background
                    onPrimary: Colors.white, // foreground
                  ),
                  child: Text(
                    "POTVRDI",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
