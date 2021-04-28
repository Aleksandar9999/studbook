import 'package:student_connection/model/studyprogram.dart';

class User {
  String username;
  String password;
  String email;

  String name;
  String surname;
  String pol;
  DateTime dateTime;
  String faculty;
  String studyProgramId;
  String yearStudy;
  String userId;
  StudyProgramModel studyProgram;
  User({
    this.studyProgram,
    this.userId,
    this.username,
    this.password,
    this.email,
    this.name,
    this.surname,
    this.pol,
    this.dateTime,
    this.faculty,
    this.studyProgramId,
    this.yearStudy,
  });
}

User loggedInUser;
