import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenibisim/auth/auth.dart';
import 'package:yenibisim/initalize/app_initialize.dart';
import 'package:yenibisim/pages/register_page.dart';
import 'package:yenibisim/pages/slack/lottie_widget.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LottieWidget(),
    );
  }
}
