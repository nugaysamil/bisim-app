import 'package:flutter/material.dart';
import 'package:yenibisim/product/constant/index.dart';

import '../../widgets/details_appbar_widget.dart';

class LanguageSelection extends StatefulWidget {
  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  String selectedLanguage = 'tr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(
        detailsText: StringConstants.changeLanguage,
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          RadioListTile(
            title: Text('Türkçe'),
            value: 'tr',
            groupValue: selectedLanguage,
            onChanged: (value) {
              setState(() {
                selectedLanguage = value.toString();
              });
            },
          ),
          SizedBox(height: 8),
          RadioListTile(
            title: Text('English'),
            value: 'en',
            groupValue: selectedLanguage,
            onChanged: (value) {
              setState(() {
                selectedLanguage = value.toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
