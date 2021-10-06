import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayData extends StatelessWidget {
  const DisplayData({
    Key? key,
    required this.users,
  }) : super(key: key);

  final Stream<QuerySnapshot<Object?>> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height: 250,
            padding: const EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: StreamBuilder<QuerySnapshot>(
              stream: users,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text('Loading');
                }

                final data = snapshot.requireData;

                return ListView.builder(
                    itemCount: data.size,
                    itemBuilder: (context, index) {
                      return Text(
                          'My name is ${data.docs[index]['firstname']} ${data.docs[index]['middlename']} ${data.docs[index]['lastname']}');
                    });
              },
            )),
      ),
    );
  }
}
