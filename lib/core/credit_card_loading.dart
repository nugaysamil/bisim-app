import 'package:flutter/material.dart';

import '../product/constant/string_constant.dart';
import 'companents/amount_card_widget.dart';
import 'companents/card_screen.dart';
import 'companents/subscriber_comp.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

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
            AmountWidget(),
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
                Text('Toplam Yükleme Tutarı: ₺ 40.0'),
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
