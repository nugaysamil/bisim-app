import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yenibisim/home/companenets/camera_button.dart';
import 'package:yenibisim/pages/register_page.dart';
import 'package:yenibisim/product/constant/index.dart';

import '../widgets/details_basic_text.dart';
import 'companenets/menu_items_details.dart';

class MenuItems extends StatefulWidget {
  const MenuItems({super.key});

  @override
  State<MenuItems> createState() => _MenuItemsState();
}

class _MenuItemsState extends State<MenuItems> {
  void signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  TextEditingController nameAndSurnameController = TextEditingController();

  void getNameAndSurnameFromFirestore() async {
    final user = FirebaseAuth.instance.currentUser;
    final userId = user!.uid;

    try {
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userData.exists) {
        final nameAndSurname = userData.get('nameAndSurname');

        setState(() {
          nameAndSurnameController.text = nameAndSurname;
        });
      }
    } catch (e) {
      print('Firestore veri okuma hatası: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    getNameAndSurnameFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: SingleChildScrollView(
              child: Container(
                width: 500,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(225, 48, 47, 47),
                      Color(0xFFA09694)
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Image.asset('assets/power-on.png'),
                      onPressed: () {
                        signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        nameAndSurnameController.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 160),
                      child: CameraButton(),
                    ),
                  ],
                ),
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
          DetailsBasicText(
            menuItemsDetailsText: StringConstants.copyright,
          )
        ],
      ),
    );
  }
}
