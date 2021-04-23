import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersRef = FirebaseFirestore.instance.collection("users");
Future<bool> ValidUser(String username, String password) async {
  var s = await usersRef.doc(username).get();
  if (!s.exists) return false;

  if (s.data()['password'] == password)
    return true;
  else
    return false;
}
