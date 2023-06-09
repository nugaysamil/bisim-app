// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yenibisim/initalize/readfromfirebase.dart';

import 'package:yenibisim/product/constant/string_constant.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(130);



  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 130,
      backgroundColor: Colors.grey[200],
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ColoredBox(
                  color: Colors.white10,
                  child: Column(
                    children: [
                      Text(
                        StringConstants.useQuantity,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                        ),
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Image.asset(
                        'assets/icons/cycling.png',
                        width: 30,
                        height: 35,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '5',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ColoredBox(
                  color: Colors.white10,
                  child: Column(
                    children: [
                      Text(
                        StringConstants.totalTime,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                        ),
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Image.asset(
                        'assets/icons/hourglass.png',
                        width: 30,
                        height: 35,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '2.1 sa.',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ColoredBox(
                  color: Colors.white10,
                  child: Column(
                    children: [
                      Text(
                        StringConstants.totalCalories,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                        ),
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Image.asset(
                        'assets/icons/calories.png',
                        width: 30,
                        height: 35,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        '723.0 kcal',
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.grey[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ColoredBox(
                  color: Colors.white10,
                  child: Column(
                    children: [
                      Text(
                        StringConstants.balance,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[900],
                        ),
                        softWrap: false,
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Image.asset(
                        'assets/icons/cycling.png',
                        width: 30,
                        height: 35,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      
                     ReadFromFirebase()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
