import 'package:student_connection/repository/studyprograms.dart';
import 'package:student_connection/widgets/subject.dart';

class StudyProgramModel {
  String idProgram;
  String nameProgram;
  List<Subject> subjectsProgram;
}

Future<StudyProgramModel> getProgram(idProgram) async {}
