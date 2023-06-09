import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../product/constant/string_constant.dart';
import 'companents/card_screen.dart';

import 'companents/subscriber_comp.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  int topic = 0;
  List<int> myItems = [50, 60, 100, 120, 150];

  void saveTopicToFirestore(int topic) async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user!.uid;

    CollectionReference topicsRef =
        FirebaseFirestore.instance.collection('topics');

    await topicsRef.doc(userId).set({
      'topic': topic,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            setState(() {});
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.grey.shade900,
        title: Text('Kredi Yükle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.subscriberName,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SubscriberWidget(),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade200,
              thickness: 3.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Kredi Seçiniz',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: myItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState?> states) {
                          if (states.contains(MaterialState)) {
                            return Colors.grey;
                          }
                          return Colors.grey;
                        },
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        topic = myItems[index];
                      });
                      saveTopicToFirestore(topic);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text(
                        myItems[index].toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey.shade200,
              thickness: 3.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Kullanılacak Bakiye:  $topic',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            Divider(
              color: Colors.grey.shade200,
              thickness: 3.0,
            ),
            SizedBox(
              height: 20,
            ),
            CardScreen(),
          ],
        ),
      ),
    );
  }
}
