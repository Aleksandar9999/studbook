import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset("files/logoforweb.jpg"),
      )),
    );
  }
}
