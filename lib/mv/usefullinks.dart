import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class UseFulLinks extends StatelessWidget {
  String url;
  String naziv;

  UseFulLinks({this.url, this.naziv});

  otovirURL() {
    launch(url);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: otovirURL,
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
              child: Text(naziv, overflow: TextOverflow.ellipsis, maxLines: 3),
            )),
          ],
        ),
      ),
    );
  }
}
