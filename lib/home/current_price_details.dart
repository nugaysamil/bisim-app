import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yenibisim/home/announcement_widget.dart';
import 'package:yenibisim/home/companenets/current_price_details.dart';

import '../product/constant/string_constant.dart';

class CurrentPrice extends StatelessWidget {
  const CurrentPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 340,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CurrentPriceDetails()));
        },
        child: Column(
          children: [
            Image.asset(
              'assets/app-pic2.jpeg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                StringConstants.currentPrice,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
