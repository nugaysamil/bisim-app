import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../widgets/button_widget.dart';
import 'input_formatters.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  TextEditingController cardNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(19),
                    CardNumberInputFormatter()
                  ],
                  decoration: InputDecoration(
                    hintText: "Card Number",
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Icon(Icons.credit_card),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Icon(Icons.people),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(4),
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberInputFormatter()
                        ],
                        decoration: InputDecoration(
                          hintText: "CVV",
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Icon(Icons.balance),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(5),
                          FilteringTextInputFormatter.digitsOnly,
                          CardMontInputFormatter(),
                        ],
                        decoration: InputDecoration(
                          hintText: "MM/YY",
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Icon(Icons.balance),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
