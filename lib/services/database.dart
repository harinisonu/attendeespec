//import 'package:attendees_spec/models/student.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseService {
//   getstudentdata(String studentid) {
//     return Firestore.instance.collection('student').document(studentid).snapshots().asyncMap((snap) async {
//       List<String> studentListsArr = snap.data['attendance'];
//       var studentList = <DocumentSnapshot>[];
//       for (var studentPath in studentListsArr) {
//         studentList.add(await Firestore.instance.document(studentPath).get());
//       }
//       return studentList;
//     });
//   }
// }



// class DatabaseService {
//   final CollectionReference studentCollection =
//       Firestore.instance.collection('student');


//   Future updateStudentData(int rollno, String name, String dept, int year,
//       String section, int percentage, int semester) async {
//     return await studentCollection.document().setData({
//       'rollno': rollno,
//       'name': name,
//       'dept': dept,
//       'year': year,
//       'section': section,
//     });
//   }

// //student list from snapshot
//   List<Student> _studentListFromSnapshot(QuerySnapshot snapshot) {
//     return snapshot.documents.map((doc) {
//       return Student(
//         rollno: doc.data['rollno'] ?? 0,
//         name: doc.data['name'] ?? '',
//         dept: doc.data['dept'] ?? '',
//         year: doc.data['year'] ?? 0,
//         section: doc.data['section'] ?? '',

//       );
//     }).toList();
//  }

// //get student streams
//   Stream<List<Student>> get student {
//     return studentCollection.snapshots().map(_studentListFromSnapshot);
//   }
// }


 

  