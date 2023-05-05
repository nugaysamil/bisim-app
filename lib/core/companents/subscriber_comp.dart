import 'package:flutter/material.dart';


class SubscriberWidget extends StatelessWidget {
  const SubscriberWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 1,
            //offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '₺ 0.1',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Mobile ödeme',
          ),
          Text(
            'Abonelik ₺ 0.1',
          ),
        ],
      ),
    );
  }
}
