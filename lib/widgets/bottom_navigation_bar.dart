import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home/announcement_widget.dart';
import '../home/google_maps.dart';
import '../home/menu_items.dart';

class NavigatorBar extends StatefulWidget {

  const NavigatorBar({Key? key,}) : super(key: key);

  @override
  State<NavigatorBar> createState() => _NavigatorBarState();
}

//var pagesList = [MenuItems(), AnnoucmentWidget(), MapSample()];

class _NavigatorBarState extends State<NavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.indigo,
      backgroundColor: Colors.grey.shade100,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.announcement_outlined),
          label: 'Duyurular',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Settings',
        ),
      ],
      elevation: 0,
      iconSize: 30,
      onTap: (value) {
        
        
      },
    );
  }
}
