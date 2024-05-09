import 'package:flutter/material.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 190),
        child: Center(
          child: Image.asset(
            'assets/qr-code.png',
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget scanButton() {
      return Container(
        margin: const EdgeInsets.only(top: 110),
        child: SizedBox(
          height: 55,
          width: 162.5,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text(
                'SCAN',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          scanButton(),
        ],
      ),
    );
  }
}
