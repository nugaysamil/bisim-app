import 'package:flutter/material.dart';


import '../../product/constant/string_constant.dart';
import '../../widgets/details_appbar_widget.dart';

class CurrentPriceDetails extends StatelessWidget {
  const CurrentPriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(
        detailsText: StringConstants.currentPrice,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/app-pic2.jpeg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              StringConstants.currentPriceDetails,
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
