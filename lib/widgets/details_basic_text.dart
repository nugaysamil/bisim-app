// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../product/constant/string_constant.dart';

class DetailsBasicText extends StatelessWidget {
  final String menuItemsDetailsText;
  const DetailsBasicText({
    Key? key,
    required this.menuItemsDetailsText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      menuItemsDetailsText,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 13,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300),
    );
  }
}
