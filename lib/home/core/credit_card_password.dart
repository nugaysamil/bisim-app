import 'package:flutter/material.dart';
import 'package:yenibisim/product/constant/string_constant.dart';
import 'package:yenibisim/widgets/button_widget.dart';

import '../../widgets/details_appbar_widget.dart';
import '../../widgets/details_basic_text.dart';

class CreditCardPassword extends StatelessWidget {
  const CreditCardPassword({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(
        detailsText: StringConstants.creditCardEdit,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  color: Colors.grey
                      .shade300, // Satırın arka plan rengini gri olarak ayarladık
                  child: Image.asset(
                    'assets/id-card.png',
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: 3),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 330),
            child: DetailsBasicText(
                menuItemsDetailsText: StringConstants.cardPassword),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(2.0)),
                ),
                filled: false,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(left: 10.0),
              ),
              initialValue: StringConstants.cardPassword,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          ButtonWidget(changeString: StringConstants.sendText, onPressed: () {})
        ],
      ),
    );
  }
}
