import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yenibisim/home/companenets/camera_button.dart';
import 'package:yenibisim/product/constant/index.dart';

import '../widgets/details_basic_text.dart';
import 'companenets/menu_items_details.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Container(
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [Color.fromARGB(225, 48, 47, 47), Color(0xFFA09694)],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Image.asset('assets/power-on.png'),
                    onPressed: () {},
                  ),
                  SizedBox(width: 5),
                  Text(
                    StringConstants.nameHereText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 180),
                    child: CameraButton(),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 360),
            child: Text(
              StringConstants.menuText,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          MenuItemsDetails(
            profileEdit: StringConstants.profileEdit,
            creditCardEdit: StringConstants.creditCardEdit,
            faultNotification: StringConstants.faultNotification,
            priceText: StringConstants.priceText,
            helpText: StringConstants.helpText,
            userAgreement: StringConstants.userAgreement,
            changeLanguages: StringConstants.changeLanguage,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/call-2.png',
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/email.png',
                width: 35,
                height: 35,
              ),
            ],
          ),
          SizedBox(height: 10),
         DetailsBasicText(menuItemsDetailsText: StringConstants.copyright,)
        ],
      ),
    );
  }
}
