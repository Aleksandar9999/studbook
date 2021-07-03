import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_connection/model/User.dart';
import 'package:student_connection/widgets/header.dart';
import 'package:intl/intl.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:student_connection/repository/UsersRepository.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final imeController = new TextEditingController();
  final prezimeController = new TextEditingController();
  final polController = new TextEditingController();
  final userController = new TextEditingController();
  final datumController = new TextEditingController();
  final fakultetController = new TextEditingController();
  final studijskiController = new TextEditingController();
  final lozinkaController = new TextEditingController();
  final emailController = new TextEditingController();
  final godinaStudijaController = new TextEditingController();
  DateTime selectedDate = DateTime.now();

  List<String> fakulteti = ["FTN", "PMF"];
  List<String> godinaStudija = [
    '1(prva)',
    '2(druga)',
    '3(treća)',
    '4(četvrta)',
    '5(peta)'
  ];
  List<String> studijskiProgram = [];
  List<String> pol = ["Muški", "Ženski"];
  String fakultet = "";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1980, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        datumController.text = DateFormat('dd-MM-yyyy').format(selectedDate);
      });
  }

  saveUser() async {
    String id = Uuid().v1();
    User user = User(
        dateTime: selectedDate,
        email: emailController.text,
        faculty: fakultetController.text,
        name: imeController.text,
        //TODO: TREBA ID STUDIJSKOG PROGRAMA//studyProgramId: studijskiController.text,
        password: lozinkaController.text,
        gender: polController.text,
        surname: prezimeController.text,
        username: userController.text,
        yearStudy: godinaStudijaController.text);
    print(user);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Obrada podataka...')));
    await usersRef.doc(userController.text).set({
      "dateTime": selectedDate,
      "email": emailController.text,
      "faculty": fakultetController.text,
      "name": imeController.text,
      //"studyProgram": studijskiController.text,
      "password": lozinkaController.text,
      "pol": polController.text,
      "surname": prezimeController.text,
      "username": userController.text,
      "yearStudy": godinaStudijaController.text
    });

    Navigator.pop(context, [true]);
  }

  getStudijeskePrograme() {
    setState(() {
      if (fakultet != "") {
        studijskiProgram.add("Arhitektura");
        studijskiProgram.add("Biomedicinski");
        studijskiProgram.add("E1");
        studijskiProgram.add("E2");
      }
    });
  }

  final _formKey = GlobalKey<FormState>();
  String imeError;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.5,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Header(),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: TextFormField(
                controller: imeController,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  return null;
                },
                decoration: InputDecoration(hintText: "Ime"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: TextFormField(
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  return null;
                },
                controller: prezimeController,
                decoration: InputDecoration(hintText: "Prezime"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: DropDownField(
                controller: polController,
                items: pol,
                hintText: "Pol",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: TextFormField(
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  return null;
                },
                onTap: () => _selectDate(context),
                controller: datumController,
                decoration: InputDecoration(
                    hintText: DateFormat('dd-MM-yyyy').format(DateTime.now())),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: DropDownField(
                controller: fakultetController,
                items: fakulteti,
                hintText: "Fakultet",
                onValueChanged: (value) {
                  setState(() {
                    fakultet = value;
                    studijskiProgram.clear();
                    if (value == "FTN") studijskiProgram.add("Arhitektura");
                    studijskiProgram.add("Biomedicinski");
                    studijskiProgram.add("E1");
                    studijskiProgram.add("E2");
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: DropDownField(
                controller: studijskiController,
                items: studijskiProgram,
                hintText: "Studijski program",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: DropDownField(
                controller: godinaStudijaController,
                hintText: "Godina studija",
                items: godinaStudija,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: TextFormField(
                controller: emailController,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  return null;
                },
                decoration: InputDecoration(hintText: "Email"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: TextFormField(
                controller: userController,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  return null;
                },
                decoration: InputDecoration(hintText: "Korisnicko ime"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: TextFormField(
                controller: lozinkaController,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  return null;
                },
                decoration: InputDecoration(hintText: "Lozinka"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: TextFormField(
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  else if (newValue != lozinkaController.text)
                    return 'Lozinke su razlicite.';
                  return null;
                },
                decoration: InputDecoration(hintText: "Lozinka ponovo"),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 15, right: 15, bottom: 30),
                child: Center(
                  child: GestureDetector(
                      onTap: () => {
                            if (_formKey.currentState.validate()) {saveUser()}
                          },
                      child: Container(
                        width: 100,
                        height: 50,
                        child: Center(
                            child: Text(
                          "POTVRDI",
                          style: TextStyle(color: Colors.white),
                        )),
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(12)),
                      )),
                )),
          ],
        ),
      ),
    ));
  }
}
