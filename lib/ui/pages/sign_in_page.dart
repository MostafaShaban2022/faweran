import 'package:faweran/cubit/auth_cubit.dart';
import 'package:faweran/models/social_model.dart';
import 'package:faweran/services/firebase_service.dart';
import 'package:faweran/ui/pages/forgot_password_page.dart';
import 'package:faweran/ui/pages/home_page.dart';
import 'package:faweran/ui/pages/sign_up_page.dart';
import 'package:faweran/ui/widgets/custom_text_form_field.dart';
import 'package:faweran/ui/widgets/social_items.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key, required this.controller});
  final TextEditingController controller;
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final FirebaseServices _auth = FirebaseServices();
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AnimationConfiguration.staggeredList(
        position: 0,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 51),
              child: Container(
                height: 90,
                width: 231,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/coupon (2) 2.png',
                    ),
                  ),
                ),
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.red, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(2),
                          blurRadius: 2,
                          spreadRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 12, right: 5),
                    child: Row(
                      children: [
                        Text(
                          'sss',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget content() {
      return AnimationConfiguration.staggeredList(
        position: 1,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 18, left: 15),
              child: const Center(
                child: Text(
                  'Welcome Back👋',
                  style: TextStyle(
                    color: Color(0xff80848A),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget emailInput() {
      return CustomTextFormField(
        title: 'Email Address',
        hintText: 'example@gmal.com',
        controller: emailController,
        obscureText: false,
      );
    }

    Widget passwordInput() {
      return CustomTextFormField(
        title: 'Your Password',
        hintText: '********',
        controller: passwordController,
        obscureText: true,
      );
    }

    Widget forget() {
      return AnimationConfiguration.staggeredList(
        position: 5,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(
                top: 15,
                right: 24,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPage(),
                    ),
                  );
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget tacButton() {
      return AnimationConfiguration.staggeredList(
        position: 5,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                }
                if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 56,
                  width: 322.5,
                  child: TextButton(
                    onPressed: () async {
                      if (kDebugMode) {
                        print(passwordController.text);
                      }
                      context.read<AuthCubit>().SignIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xffE41937),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    Widget line() {
      return AnimationConfiguration.staggeredList(
        position: 7,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(
                top: 27.5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 1,
                    width: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(176),
                      ),
                      color: Colors.grey,
                    ),
                  ),
                  const Text(
                    'or',
                    style: TextStyle(
                      color: Color(0xff80848A),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: 160,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(176),
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget social() {
      return AnimationConfiguration.staggeredList(
        position: 8,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final GoogleSignIn googleSignIn = GoogleSignIn();

                        try {
                          final GoogleSignInAccount? googleSignInAccount =
                              await googleSignIn.signIn();

                          if (googleSignInAccount != null) {
                            final GoogleSignInAuthentication
                                googleSignInAuthentication =
                                await googleSignInAccount.authentication;

                            final AuthCredential credential =
                                GoogleAuthProvider.credential(
                              accessToken:
                                  googleSignInAuthentication.accessToken,
                              idToken: googleSignInAuthentication.idToken,
                            );

                            await _auth.signInWithCredential(
                                credential); // Corrected name
                          }
                        } catch (e) {
                          print("Error signing in with Google: $e");
                        }
                      },
                      child: SocialItems(
                        Social(
                          id: 2,
                          imageUrl: 'assets/google.png',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SocialItems(
                      Social(
                        id: 3,
                        imageUrl: 'assets/apple.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return AnimationConfiguration.staggeredList(
        position: 9,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 17.5),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: Color(0xff80848A),
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(
                    width: 6.75,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(
                            controller: controller,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
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
            content(),
            // title(),
            emailInput(),
            passwordInput(),
            forget(),
            tacButton(),
            line(),
            social(),
            footer(),
          ],
        ),
      ),
    );
  }
}
