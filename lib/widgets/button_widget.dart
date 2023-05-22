// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:yenibisim/core/credit_card_loading.dart';
import 'package:yenibisim/home/core/fault_notification_widget.dart';
import 'package:yenibisim/product/constant/string_constant.dart';

class ButtonWidget extends StatelessWidget {
  final String changeString;
  final Function onPressed;
  const ButtonWidget({
    Key? key,
    required this.changeString,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        changeString,
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
    );
  }
}
