import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yenibisim/auth/login_or_register.dart';
import 'package:yenibisim/pages/home_page.dart';
import 'package:yenibisim/pages/register_page.dart';

import '../initalize/app_initialize.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData) {
              return const MapSample();
            }
            //User is not logged in
            else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
