import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

final programsRef = FirebaseFirestore.instance.collection("studyprograms");

void popuni() {
  var id = Uuid().v1();
  /* programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set({
    "ime": "Racunarski praktikum",
    "godina": "1",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef
      .doc("1Vb1XDy4b5So1iTT41nf")
      .collection('subjects')
      .doc(id)
      .set({"ime": "Algebra", "godina": "1", "semestar": "1", "id": id});
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set(
      {"ime": "Uvod u geodeziju", "godina": "1", "semestar": "1", "id": id});
  id = Uuid().v1();
  programsRef
      .doc("1Vb1XDy4b5So1iTT41nf")
      .collection('subjects')
      .doc(id)
      .set({"ime": "Fizika", "godina": "1", "semestar": "1", "id": id});
  id = Uuid().v1();
  programsRef
      .doc("1Vb1XDy4b5So1iTT41nf")
      .collection('subjects')
      .doc(id)
      .set({"ime": "Perspektiva", "godina": "1", "semestar": "1", "id": id});
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set({
    "ime": "Nacrtna geometrija u geomatici",
    "godina": "1",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set({
    "ime": "Matematička analiza 1",
    "godina": "1",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef
      .doc("1Vb1XDy4b5So1iTT41nf")
      .collection('subjects')
      .doc(id)
      .set({"ime": "Geodezija 1", "godina": "1", "semestar": "2", "id": id});
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set(
      {"ime": "Osnove geonauka", "godina": "1", "semestar": "2", "id": id});
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set({
    "ime": "Tehnike geodetskih merenja",
    "godina": "1",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set({
    "ime": "Uvod u informacione tehnologije u geomatici",
    "godina": "1",
    "semestar": "2",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set(
      {"ime": "Sociologija tehnike", "godina": "1", "semestar": "2", "id": id});
  id = Uuid().v1();
  programsRef
      .doc("1Vb1XDy4b5So1iTT41nf")
      .collection('subjects')
      .doc(id)
      .set({"ime": "Ekonomija", "godina": "1", "semestar": "2", "id": id});
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set({
    "ime": "Matematička analiza 2",
    "godina": "3",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef
      .doc("1Vb1XDy4b5So1iTT41nf")
      .collection('subjects')
      .doc(id)
      .set({"ime": "Geodezija 2", "godina": "2", "semestar": "1", "id": id});
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set(
      {"ime": "Opšta kartografija", "godina": "2", "semestar": "1", "id": id});
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set({
    "ime": "Informacioni sistemi i baze podataka",
    "godina": "2",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set({
    "ime": "Sistemi i signali u geomatici",
    "godina": "2",
    "semestar": "1",
    "id": id
  });
  id = Uuid().v1();
  programsRef.doc("1Vb1XDy4b5So1iTT41nf").collection('subjects').doc(id).set({
    "ime": "Osnove građevinarstva",
    "godina": "2",
    "semestar": "1",
    "id": id
  }); */
}
