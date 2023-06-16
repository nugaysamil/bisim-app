import 'package:flutter/material.dart';
import 'package:yenibisim/product/constant/string_constant.dart';

import 'companenets/annoucement_details.dart';
import 'current_price_details.dart';

class AnnouncementWidget extends StatelessWidget {
  const AnnouncementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: SizedBox(
            width: 500,
            height: 340,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnnoucementDetails()));
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/app-pic1.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      StringConstants.annoucement,
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
          ),
        ),
        CurrentPrice(),
      ],
    );
  }
}
