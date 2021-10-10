import 'package:booksynation/page/patient_info/widgets/infoData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DisplayData extends StatelessWidget {
  const DisplayData({
    Key? key,
  }) : super(key: key);

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
                      return Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              'My name is ${data.docs[index]['FirstName']} ${data.docs[index]['MiddleName']} ${data.docs[index]['LastName']} ${data.docs[index]['Suffix']}'),
                          Text('Gender: ${data.docs[index]['Sex']}'),
                          Text('Bdate: ${data.docs[index]['Bday']}'),
                          Text(
                              'Civil Status:${data.docs[index]['Civil_Status']} '),
                          Text(
                              'Philhealth:${data.docs[index]['Philhealth_Num']}'),
                        ],
                      );
                    });
              },
            )),
      ),
    );
  }
}
