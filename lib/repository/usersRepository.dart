import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_connection/model/studyprogram.dart';
import 'package:student_connection/repository/StudyProgramsRepository.dart';
import 'package:student_connection/model/User.dart';

bool userLoad = false;
final usersRef = FirebaseFirestore.instance.collection("users");

Future<bool> ValidUser(String username, String password) async {
  var s = await usersRef.doc(username).get();
  if (!s.exists) return false;

  if (s.data()['password'] == password) {
    StudyProgramModel modl;
    await getStudyProgram(s.data()['studyProgram'])
        .then((value) => modl = value);
    loggedInUser = User(
        userId: username,
        username: username,
        name: s.data()['name'],
        studyProgramId: s.data()['studyProgram'],
        yearStudy: s.data()['yearStudy'],
        studyProgram: modl,
        email: s.data()['email'],
        faculty: s.data()['faculty'],
        surname: s.data()['surname'],
        gender: s.data()['pol']);

    userLoad = true;
    return true;
  } else
    return false;
}
