import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:student_connection/model/studyprogram.dart';
import 'package:student_connection/widgets/comment.dart';
import 'package:student_connection/widgets/study_program.dart';

import 'package:student_connection/widgets/subject.dart';
import 'package:student_connection/widgets/usefullinks.dart';

final programsRef = FirebaseFirestore.instance.collection("studyprograms");
final commentsRef = FirebaseFirestore.instance.collection("comments");
final linksRef = FirebaseFirestore.instance.collection("links");
List<Subject> listSubjects = [];
List<Comment> listComment = [];
List<UseFullLink> listUsefullLinks = [];
String subjectId;
Future<List<Subject>> GetListSubjects(idProgram) async {
  if (listSubjects.isNotEmpty) return listSubjects;

  QuerySnapshot querySnapshot =
      await programsRef.doc(idProgram).collection('subjects').get();

  querySnapshot.docs.forEach((element) {
    Subject subject = Subject.fromDocument(element);
    listSubjects.add(subject);
  });

  return listSubjects;
}

Future<List<Comment>> GetSubjectComments(idSubject) async {
  if (listComment.isNotEmpty) listComment.clear();

  QuerySnapshot querySnapshot =
      await commentsRef.where('idSubject', isEqualTo: idSubject).get();

  querySnapshot.docs.forEach((element) {
    print(element.data()['idSubject']);

    listComment.add(Comment.fromDocument(element));
  });

  return listComment;
}

Future<List<UseFullLink>> GetSubjectUseFullLinks(idSubject) async {
  if (listUsefullLinks.isNotEmpty) listUsefullLinks.clear();
  print("DADADA");
  QuerySnapshot querySnapshot =
      await linksRef.where('idSubject', isEqualTo: idSubject).get();
  print(querySnapshot.docs);
  querySnapshot.docs.forEach((element) {
    listUsefullLinks.add(UseFullLink.fromDocument(element));
  });
  return listUsefullLinks;
}

Future<int> GetSubjectMark(idSubject) async {
  await GetSubjectComments(idSubject);
  int mark = 0;
  if (listComment != null)
    listComment.forEach((element) {
      mark += element.mark;
    });
  print(mark / listComment.length);
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

/* void popuni() {
  var id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Matematička analiza 1",
    "godina": "1",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef
      .doc("fCcvuILclamUuO63qpKo")
      .collection('subjects')
      .doc(id)
      .set({"ime": "Algebra", "godina": "1", "semestar": "1", "id": id});
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Programski jezici i strukture podataka",
    "godina": "1",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Engleski jezik - osnovni",
    "godina": "1",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Engleski jezik - srednji",
    "godina": "1",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Engleski jezik - viši",
    "godina": "1",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef
      .doc("fCcvuILclamUuO63qpKo")
      .collection('subjects')
      .doc(id)
      .set({"ime": "Fizika", "godina": "1", "semestar": "2", "id": id});
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Osnovi elektrotehnike",
    "godina": "1",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Arhitektura računara",
    "godina": "1",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Engleski jezik - srednji",
    "godina": "1",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Engleski jezik - viši",
    "godina": "1",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Nemački jezik - osnovni",
    "godina": "1",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Modeliranje i simulacija sistema",
    "godina": "2",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Logičko projektovanje računarskih sistema 1",
    "godina": "2",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Matematička analiza 2",
    "godina": "2",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Objektno programiranje",
    "godina": "2",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set(
      {"ime": "Operativni sistemi", "godina": "2", "semestar": "2", "id": id});
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Sociološki aspekti tehničkog razvoja",
    "godina": "2",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Sistemi automatskog upravljanja",
    "godina": "2",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Sistemska programska podrška u realnom vremenu 1",
    "godina": "2",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("fCcvuILclamUuO63qpKo").collection('subjects').doc(id).set({
    "ime": "Verovatnoća i slučajni procesi",
    "godina": "2",
    "semestar": "2",
    "id": id
  });
} */
