// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenibisim/data_provider/data_provider.dart';
import 'package:yenibisim/initalize/app_initialize.dart';
import 'package:yenibisim/model/all_list.dart';

import 'package:yenibisim/product/constant/index.dart';

import '../../model/model.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/details_appbar_widget.dart';
import '../../widgets/details_basic_text.dart';

class FaultNotification extends ConsumerStatefulWidget {
  FaultNotification({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FaultNotificationState();
}

class _FaultNotificationState extends ConsumerState<FaultNotification> {
  String? dropDownItemValue;
  String? selectedFault;

  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();

    void saveToDescription() {
      CollectionReference descriptionRef =
          FirebaseFirestore.instance.collection('faultNotification');

      descriptionRef.add({'description': descriptionController.text});
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

    void writeToFirestore(String value) {
      final firestoreInstance =
          FirebaseFirestore.instance.collection('faultNotification');

      firestoreInstance.doc().set({'value': value}).then((value) {
        showSuccessDialog();
      }).catchError((error) {
        print('Veriyi Firestore\'a yazarken bir hata oluştu: $error');
      });
    }

    return Scaffold(
      appBar: DetailsAppBar(detailsText: StringConstants.faultNotification),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DetailsBasicText(
              menuItemsDetailsText:
                  StringConstants.faultNotificationDetailsText,
            ),
          ),
          ref.watch(singleUserDataProvider).when(
            data: (data) {
              var dataName = data!.network!.stations;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  value: dropDownItemValue,
                  hint: const Text(
                    'İstasyon Seç',
                    style: TextStyle(fontStyle: FontStyle.normal),
                  ),
                  isExpanded: true,
                  items: dataName?.map((e) {
                    return DropdownMenuItem(
                        child: Text(e.name.toString()),
                        value: e.name.toString());
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(
                      () {
                        dropDownItemValue = newValue!;
                      },
                    );
                  },
                ),
              );
            },
            error: (((error, stackTrace) {
              return Text(''.toString());
            })),
            loading: () {
              return const CircularProgressIndicator();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: StringConstants.explation,
                contentPadding: EdgeInsets.fromLTRB(0, 20, 5,
                    50), // Boyutu ayarlamak için contentPadding kullanın
              ),
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              value: selectedFault,
              isExpanded: true, // Yeni eklenen özellik

              hint: Text(
                'Arıza Seç',
                style: TextStyle(fontStyle: FontStyle.normal),
              ),
              onChanged: (newValue) {
                setState(() {
                  selectedFault = newValue;
                });
              },
              items: listAll.faultList.map((fault) {
                return DropdownMenuItem<String>(
                  value: fault,
                  child: Text(fault),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 5),
          FilledButton(
            onPressed: () {
              writeToFirestore(dropDownItemValue.toString());
              writeToFirestore(selectedFault.toString());
              saveToDescription();
            },
            child: Text(
              StringConstants.sendText,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.blue.shade900,
              padding: const EdgeInsets.symmetric(
                horizontal: 170,
              ),
            ),
          )
        ],
      ),
    );
  }
}
