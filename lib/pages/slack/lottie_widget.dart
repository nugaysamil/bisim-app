import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:yenibisim/auth/auth.dart';
import 'package:yenibisim/initalize/app_initialize.dart';
import 'package:yenibisim/pages/register_page.dart';

class LottieWidget extends StatefulWidget {
  const LottieWidget({Key? key});

  @override
  State<LottieWidget> createState() => _LottieWidgetState();
}

class _LottieWidgetState extends State<LottieWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 120,
            width: 120,
            child: Image.asset('assets/bisim-image.jpeg'),
          ),
          SizedBox(
            height: 400,
            child: animation(),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                'Merhaba Hoşgeldiniz. Bu bisim uygulaması ile İzmirdeki bütün bisiklet istasyonlarına ulaşabilirsiniz!',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MapSample()));
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'Üye olmadan giriş yap',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterPage()));
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  'Hadi başlayalım!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

Widget animation() {
  return Container(
    child: Lottie.network(
        'https://assets10.lottiefiles.com/packages/lf20_sgnacf85.json'),
  );
}
