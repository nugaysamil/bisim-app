import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_formatters.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  TextEditingController cardNumberController = TextEditingController();
  final cardController = TextEditingController();
  final nameController = TextEditingController();
  final cvController = TextEditingController();
  final dateController = TextEditingController();

  void saveDataToFirebase() {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user!.uid;
    CollectionReference collRef =
        FirebaseFirestore.instance.collection('cards');

    collRef.doc(userId).set({
      'cardNumber': cardController.text,
      'fullName': nameController.text,
      'cvv': cvController.text,
      'expirationDate': dateController.text,
    });
    showSuccessDialog();
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Başarılı'),
          content: Text('Veriler başarıyla kaydedildi.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tamam'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    
  }

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
                  controller: cardController,
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
                    controller: nameController,
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
                        controller: cvController,
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
                        controller: dateController,
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
                FilledButton(
                  onPressed: () {
                    saveDataToFirebase();
                  },
                  child: Text(
                    'Yükle',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 165,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
