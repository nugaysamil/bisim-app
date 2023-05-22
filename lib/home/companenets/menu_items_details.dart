// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:yenibisim/home/core/all_price.dart';
import 'package:yenibisim/home/core/credit_card_password.dart';
import 'package:yenibisim/home/core/en_tr_languages.dart';

import 'package:yenibisim/home/core/fault_notification_widget.dart';
import 'package:yenibisim/home/core/profile_edit.dart';

import '../../product/constant/string_constant.dart';

class MenuItemsDetails extends StatefulWidget {
  const MenuItemsDetails({
    Key? key,
    required this.profileEdit,
    required this.creditCardEdit,
    required this.faultNotification,
    required this.priceText,
    required this.helpText,
    required this.userAgreement,
    required this.changeLanguages,
  }) : super(key: key);

  final String profileEdit;
  final String creditCardEdit;
  final String faultNotification;
  final String priceText;
  final String helpText;
  final String userAgreement;
  final String changeLanguages;

  @override
  State<MenuItemsDetails> createState() => _MenuItemsDetailsState();
}

class _MenuItemsDetailsState extends State<MenuItemsDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 500,
      child: ListView.separated(
        padding: EdgeInsets.only(top: 10),
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileEdit(),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(widget.profileEdit),
                    trailing: Icon(Icons.arrow_right_alt_outlined, size: 30),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreditCardPassword(),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.credit_score),
                    title: Text(widget.creditCardEdit),
                    trailing: Icon(Icons.arrow_right_alt_outlined, size: 30),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FaultNotification(),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.settings),
                    title: Text(widget.faultNotification),
                    trailing: Icon(Icons.arrow_right_alt_outlined, size: 30),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 360),
                child: Text(
                  StringConstants.generalText,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllPrice(),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.money_sharp),
                    title: Text(widget.priceText),
                    trailing: Icon(Icons.arrow_right_alt_outlined, size: 30),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.help),
                    title: Text(widget.userAgreement),
                    trailing: Icon(Icons.arrow_right_alt_outlined, size: 30),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text(widget.helpText),
                    trailing: Icon(Icons.arrow_right_alt_outlined, size: 30),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LanguageSelection(),
                    ),
                  );
                },
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.language),
                    title: Text(widget.changeLanguages),
                    trailing: Icon(Icons.arrow_right_alt_outlined, size: 30),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
