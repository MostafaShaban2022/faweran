import 'dart:async';
import 'package:faweran/cubit/auth_cubit.dart';
import 'package:faweran/ui/pages/home_page.dart';
import 'package:faweran/ui/pages/log_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondSplashPage extends StatefulWidget {
  @override
  State<SecondSplashPage> createState() => _SecondSplashPageState();
}

class _SecondSplashPageState extends State<SecondSplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const LogInPage(),
          ),
          (route) => false,
        );
      } else {
        if (kDebugMode) {
          print(user.email);
        }
        context.read<AuthCubit>().getCurrntUser(user.uid);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
          (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/coupon (2) 2.png'),
      splashIconSize: 90,
      nextScreen: Container(),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
    );
  }
}
