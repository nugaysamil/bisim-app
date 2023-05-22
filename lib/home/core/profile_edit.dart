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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(detailsText: StringConstants.profileEdit),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
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
                'Arıza Seç',
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
                height: 2, // Alt çizgi yüksekliği
                color: Colors.black, // Alt çizgi rengi
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: StringConstants.explation,
                contentPadding: EdgeInsets.fromLTRB(0, 20, 5,
                    50), // Boyutu ayarlamak için contentPadding kullanın
              ),
              style: TextStyle(fontStyle: FontStyle.normal),
            ),
          ),
          ButtonWidget(changeString: StringConstants.sendText, onPressed: () {})
        ],
      ),
    );
  }
}
