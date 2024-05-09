import 'package:faweran/ui/pages/otp_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  TextEditingController phoneController = TextEditingController();
  String verificationId = "";
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 125),
        height: 90,
        width: 231,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/coupon (2) 2.png',
            ),
          ),
        ),
      );
    }

    Widget phoneNumber() {
      return Container(
        margin: const EdgeInsets.only(top: 75, right: 30, left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Phone Number',
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 14.40,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              cursorColor: Colors.red,
              controller: phoneController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16),
                hintText: '*******',
                hintStyle: const TextStyle(
                  color: Color(0xff808080),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 4.85,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xffE41937),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget tacButton() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        height: 56,
        width: 305,
        child: TextButton(
          onPressed: () async {
            try {
              await FirebaseAuth.instance.verifyPhoneNumber(
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException ex) {},
                  codeSent: (String verificationId, int? resendToken) {
                    setState(() {
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                  phoneNumber: phoneController.text.toString());

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OtpScreen(
                    verificationId: verificationId,
                  ),
                ),
              );
            } catch (ex) {
              if (kDebugMode) {
                print(ex.toString());
              }
            }
          },
          style: TextButton.styleFrom(
            backgroundColor: const Color(0xffE41937),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
          ),
          child: const Text(
            'Reset',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.25,
              fontWeight: FontWeight.w600,
              letterSpacing: 4.85,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            phoneNumber(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
