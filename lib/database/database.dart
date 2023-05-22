import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yenibisim/model/card_info_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService(this.uid);

  CollectionReference collRef = FirebaseFirestore.instance.collection('cards');

  // userData from snapshot

  CardInfo _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data! as Map<String, dynamic>;
    return CardInfo(
      uid: uid,
      fullName: data['fullName'],
      cardNumber: data['cardNumber'],
      cvv: data['cvv'],
      expirationDate: data['expirationDate'],
    );
  }

  // get user doc stream

  Stream<CardInfo> get userData {
    return collRef
        .doc(uid)
        .snapshots()
        .map((event) => CardInfo.fromDocument(event));
  }
}
