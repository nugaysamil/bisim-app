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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
