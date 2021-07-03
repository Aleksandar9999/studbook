import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/pages/facultypage.dart';
import 'package:student_connection/pages/HomePage.dart';
import 'package:student_connection/repository/StudyProgramsRepository.dart';
import 'package:student_connection/repository/UsersRepository.dart';
import 'RegistrationPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();
  final formKey = new GlobalKey<FormState>();
  navigateUser(Widget page) async {
    if (page is Home) {
      if (!formKey.currentState.validate()) {
        return;
      } else {
        if (!(await ValidUser(
            usernameController.text, passwordController.text))) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Prijava nije uspesna. Pokusajte ponovo.')));
          return;
        }
      }
    }

    var res = await Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (context, animation, secanimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeIn);
              return ScaleTransition(
                  scale: animation,
                  alignment: Alignment.bottomCenter,
                  child: child);
            },
            pageBuilder: (context, animation, secAnimation) {
              return page;
            }));
    if (res)
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Registracija uspesna.')));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(100),
              width: 80,
              height: 300,
              child: Image.asset("files/logoforweb.jpg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.trim() == "")
                    return "Obavezno polje.";
                  return null;
                },
                controller: usernameController,
                decoration: InputDecoration(hintText: "Korisničko ime:"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.trim() == "")
                    return "Obavezno polje.";
                  return null;
                },
                textInputAction: TextInputAction.go,
                onFieldSubmitted: (value) {
                  navigateUser(Home());
                },
                controller: passwordController,
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
                onPressed: () => navigateUser(Home()),
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
                onPressed: () => navigateUser(FacultyPage()),
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
                onPressed: () => navigateUser(RegistrationPage()),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("REGISTRUJTE SE"),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
