import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewUseFullLinkDialog extends StatefulWidget {
  @override
  _AddNewUseFullLinkDialogState createState() =>
      _AddNewUseFullLinkDialogState();
}

class _AddNewUseFullLinkDialogState extends State<AddNewUseFullLinkDialog> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController linkController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(10),
      backgroundColor: Colors.white,
      child: Container(
        height: 280,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Center(
                child: Text(
                  "DODAJ KORISAN LINK",
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
                controller: nameController,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  return null;
                },
                decoration: InputDecoration(hintText: "Naziv"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: TextFormField(
                controller: linkController,
                validator: (newValue) {
                  if (newValue == null || newValue.isEmpty)
                    return 'Ovo polje je obavezno.';
                  return null;
                },
                decoration: InputDecoration(hintText: "URL"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: ElevatedButton(
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
