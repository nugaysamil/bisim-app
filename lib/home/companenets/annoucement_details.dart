import 'package:flutter/material.dart';

import '../../product/constant/string_constant.dart';

class AnnoucementDetails extends StatelessWidget {
  const AnnoucementDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          StringConstants.annoucement,
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/app-pic1.jpeg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              StringConstants.telNumber,
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                  fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
