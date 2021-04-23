import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        height: 60,
        color: Colors.white,
        child: Center(
          child: Image.asset("files/logoforweb.jpg"),
        ),
      ),
    );
  }
}
