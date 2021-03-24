import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/pages/facultypage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  navigateGost() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 400),
            transitionsBuilder: (context, animation, secanimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.ease);
              return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.bottomCenter,
                  child: child);
            },
            pageBuilder: (context, animation, secAnimation) {
              return FacultyPage();
            }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(100),
            width: 80,
            height: 300,
            child: Image.asset("files/logoforweb.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextField(
              decoration: InputDecoration(hintText: "Korisničko ime:"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextField(
              decoration: InputDecoration(hintText: "Lozinka:"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 80, top: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900], // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () => {print("klik")},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: navigateGost,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "NASTAVITE KAO GOSTUJUĆI KORISNIK",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 80, right: 80, top: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () => {print("REG")},
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("REGISTRUJTE SE"),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
