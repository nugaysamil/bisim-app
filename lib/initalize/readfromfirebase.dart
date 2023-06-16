import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReadFromFirebase extends StatefulWidget {
  const ReadFromFirebase({super.key});

  @override
  State<ReadFromFirebase> createState() => _ReadFromFirebaseState();
}

class _ReadFromFirebaseState extends State<ReadFromFirebase> {
  Future<int> readFromFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user!.uid;

    CollectionReference topicsRef =
        FirebaseFirestore.instance.collection('topics');
    DocumentSnapshot snapshot = await topicsRef.doc(userId).get();

    if (snapshot.exists) {
      final topicData = snapshot.data() as Map<String, dynamic>;
      final topic = topicData['topic'] as int;
      return topic;
    } else {
      return 0;
    }
  }

  @override
  void initState() {
    super.initState();
    readFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: readFromFirebase(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Hata: ${snapshot.error}');
        } else {
          final topic = snapshot.data;

          return Text(
            '₺ $topic',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}
