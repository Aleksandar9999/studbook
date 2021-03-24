import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  String nazivPredmeta;
  String sifraPredmeta;
  String godinaStudija;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 15, right: 10),
      child: Flexible(
        child: Container(
          margin: EdgeInsets.only(left: 15, top: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nazivPredmeta,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                godinaStudija,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[800]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
