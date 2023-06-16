// ignore_for_file: unused_local_variable, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data_provider/data_provider.dart';
import '../home/announcement_widget.dart';

import '../home/menu_items.dart';
import '../widgets/google_maps_widget.dart';

class MapSample extends ConsumerStatefulWidget {
  const MapSample({super.key});

  @override
  MapSampleState createState() => MapSampleState();
}

class MapSampleState extends ConsumerState<MapSample> {
  int index = 0;
  final screens = [
    GoogleMaps(),
    AnnouncementWidget(),
    MenuItems(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigation(),
      body: screens[index],
    );
  }

  BottomNavigationBar bottomNavigation() {
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
      currentIndex: index,
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
    );
  }
}






/*  var distance;
    Marker closestMarker = _markers.first;

    _closestDistance = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        _markers.elementAt(0).position.latitude,
        _markers.elementAt(0).position.longitude);

    for (int i = 0; i < _markers.length; i++) {
      distance = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          _markers.elementAt(i).position.latitude,
          _markers.elementAt(i).position.longitude);

      print(distance);

      if (distance < _closestDistance) {
        closestMarker = _markers.elementAt(i);
        _closestDistance = distance;
      }
    }
    print("The closess  " + _closestDistance.toString()); */