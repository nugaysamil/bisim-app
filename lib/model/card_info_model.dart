// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserId {
  final String uid;

  UserId(this.uid);
}


class CardInfo {
  final String uid;
  final String cardNumber;
  final String fullName;
  final String cvv;
  final String expirationDate;

  CardInfo({
    required this.uid,
    required this.cardNumber,
    required this.fullName,
    required this.cvv,
    required this.expirationDate,
  });

  factory CardInfo.fromDocument(DocumentSnapshot doc) {
    return CardInfo(
      uid: doc.id,
      cardNumber: doc['cardNumber'],
      fullName: doc['fullName'],
      cvv: doc['cvv'],
      expirationDate: doc['expirationDate'], 
    );
  }
}
