// import 'package:booksynation/web_pages/web_data/web_vaccines_data.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class UserInformation extends StatefulWidget {
//   @override
//     _UserInformationState createState() => _UserInformationState();
// }

// class _UserInformationState extends State<UserInformation> {
//   final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('vaccine').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//           Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(''),
//               subtitle: Text(data['company']),

//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
