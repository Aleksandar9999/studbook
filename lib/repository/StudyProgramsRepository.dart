import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:student_connection/model/studyprogram.dart';
import 'package:student_connection/widgets/comment.dart';
import 'package:student_connection/widgets/StudyProgram.dart';
import 'package:student_connection/widgets/Subject.dart';
import 'package:student_connection/widgets/UsefulLink.dart';

final programsRef = FirebaseFirestore.instance.collection("studyprograms");
final commentsRef = FirebaseFirestore.instance.collection("comments");
final linksRef = FirebaseFirestore.instance.collection("links");

List<Subject> listSubjects = [];
List<Comment> listComment = [];
List<UseFullLink> listUsefullLinks = [];
String subjectId;

Future<List<Subject>> getSubjects(idProgram) async {
  if (listSubjects.isNotEmpty) return listSubjects;

  QuerySnapshot querySnapshot =
      await programsRef.doc(idProgram).collection('subjects').get();

  querySnapshot.docs.forEach((element) {
    Subject subject = Subject.fromDocument(element);
    listSubjects.add(subject);
  });
  print("Dobavio predmete");
  return listSubjects;
}

Future<List<Comment>> getSubjectComments(idSubject) async {
  if (listComment.isNotEmpty) listComment.clear();

  QuerySnapshot querySnapshot =
      await commentsRef.where('idSubject', isEqualTo: idSubject).get();

  querySnapshot.docs.forEach((element) {
    print(element.data()['idSubject']);

    listComment.add(Comment.fromDocument(element));
  });
  return listComment;
}

Future<List<UseFullLink>> getSubjectUseFullLinks(idSubject) async {
  if (listUsefullLinks.isNotEmpty) listUsefullLinks.clear();
  QuerySnapshot querySnapshot =
      await linksRef.where('idSubject', isEqualTo: idSubject).get();
  querySnapshot.docs.forEach((element) {
    listUsefullLinks.add(UseFullLink.fromDocument(element));
  });
  return listUsefullLinks;
}

Future<int> getSubjectMark(idSubject) async {
  await getSubjectComments(idSubject);
  int mark = 0;
  if (listComment != null)
    listComment.forEach((element) {
      mark += element.mark;
    });
  return mark / listComment.length as int;
}

Future<String> getName(idProgram) async {
  DocumentSnapshot querySnapshot = await programsRef.doc(idProgram).get();
  return querySnapshot['ime'];
}

Future<StudyProgramModel> getStudyProgram(idProgram) async {
  DocumentSnapshot querySnapshot = await programsRef.doc(idProgram).get();
  return StudyProgramModel(
      idProgram: querySnapshot['id'], nameProgram: querySnapshot['ime']);
}
