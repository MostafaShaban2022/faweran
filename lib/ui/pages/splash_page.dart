import 'dart:async';

import 'package:faweran/cubit/auth_cubit.dart';
import 'package:faweran/ui/pages/log_in_page.dart';
import 'package:faweran/ui/pages/second_splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
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
        print(user.email);
        context.read<AuthCubit>().getCurrntUser(user.uid);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => SecondSplashPage(),
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
      splash: Image.asset(
        'assets/coupon (1) 1.png',
      ),
      splashIconSize: 177.5,
      nextScreen: SecondSplashPage(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: const Color(0xffE41937),
    );
  }
}
