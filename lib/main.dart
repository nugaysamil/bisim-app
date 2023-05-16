import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenibisim/home/google_maps.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapSample(),
    );
  }
}
