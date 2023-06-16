import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:yenibisim/components/button.dart';
import 'package:yenibisim/components/text_field.dart';
import 'package:yenibisim/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  final nameAndSurname = TextEditingController();

  void signUp() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordTextController.text != confirmPasswordTextController.text) {
      Navigator.pop(context);
      displayMessage("Şifreler birbirleriyle uyuşmuyor");
    } else {
      try {
        final authResult =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text,
        );

        final user = authResult.user;
        final userId = user!.uid; 

        await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set({
        'nameAndSurname': nameAndSurname.text,
      });

        print(userId);

        if (context.mounted) Navigator.pop(context);

        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Giriş Başarılı'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Giriş yap'),
              ),
            ],
          ),
        );
      } on FirebaseAuthException {
        Navigator.pop(context);
        displayMessage('E-mail adresini doğru giriniz');
      }
    }
  }

  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
                Icon(
                  Icons.person,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  "Hadi, yeni bir hesap oluştur!",
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 25),

                MyTextField(
                    controller: emailTextController,
                    hintText: 'Email',
                    obsecureText: false),
                const SizedBox(height: 10),
                MyTextField(
                    controller: nameAndSurname,
                    hintText: 'İsim ve Soyisim',
                    obsecureText: false),
                const SizedBox(height: 10),

                MyTextField(
                    controller: passwordTextController,
                    hintText: 'Şifre',
                    obsecureText: true),

                const SizedBox(height: 10),
                MyTextField(
                    controller: confirmPasswordTextController,
                    hintText: 'Şifreyi yeniden gir',
                    obsecureText: true),

                const SizedBox(height: 10),
                MyButton(
                  onTap: () {
                    signUp();
                  },
                  text: 'Kayıt Ol',
                ),

                const SizedBox(height: 25),

                //go to register page
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hesabın var mı?',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        'Giriş Yap',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
