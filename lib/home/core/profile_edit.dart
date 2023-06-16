import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yenibisim/model/all_list.dart';
import 'package:yenibisim/product/constant/index.dart';
import 'package:yenibisim/widgets/button_widget.dart';
import 'package:yenibisim/widgets/details_appbar_widget.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  String? selectedFault;
  String? selectedDistrict;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  void saveToDescription(String value, String value2) {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user!.uid;
    CollectionReference descriptionRef =
        FirebaseFirestore.instance.collection('profileEdit');

    descriptionRef.doc(userId).set({
      'email': emailcontroller.text,
      'country': value,
      'district': value2,
      'description': descriptionController.text,
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(detailsText: StringConstants.profileEdit),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: emailcontroller,
              style: TextStyle(
                fontStyle: FontStyle.normal,
              ),
              decoration: InputDecoration(
                hintText: StringConstants.eposta,
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 10.0,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DropdownButton<String>(
              value: selectedFault,
              isExpanded: true,
              hint: Text(
                'İl seç',
                style: TextStyle(fontStyle: FontStyle.normal),
              ),
              onChanged: (newValue) {
                setState(() {
                  selectedFault = newValue;
                });
              },
              items: listAll.city.map(
                (fault) {
                  return DropdownMenuItem<String>(
                    value: fault,
                    child: Text(fault),
                  );
                },
              ).toList(),
              underline: Container(
                height: 2, // Alt çizgi yüksekliği
                color: Colors.black, // Alt çizgi rengi
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DropdownButton<String>(
              value: selectedDistrict,
              isExpanded: true,
              hint: Text(
                'İlçe',
                style: TextStyle(fontStyle: FontStyle.normal),
              ),
              onChanged: (newValue) {
                setState(() {
                  selectedDistrict = newValue;
                });
              },
              items: listAll.district.map(
                (district) {
                  return DropdownMenuItem<String>(
                    value: district,
                    child: Text(district),
                  );
                },
              ).toList(),
              underline: Container(
                height: 2,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: StringConstants.explation,
                contentPadding: EdgeInsets.fromLTRB(0, 20, 5, 50),
              ),
              style: TextStyle(fontStyle: FontStyle.normal),
            ),
          ),
          ButtonWidget(
              changeString: StringConstants.sendText,
              onPressed: () {
                saveToDescription(
                    selectedFault.toString(), selectedDistrict.toString());
              })
        ],
      ),
    );
  }
}
