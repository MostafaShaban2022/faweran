import 'package:faweran/cubit/auth_cubit.dart';
import 'package:faweran/models/social_model.dart';
import 'package:faweran/ui/pages/home_page.dart';
import 'package:faweran/ui/pages/phone_number_page.dart';
import 'package:faweran/ui/widgets/custom_text_form_field.dart';
import 'package:faweran/ui/widgets/social_items.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key, required this.controller});
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController controller;

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
              alignment: Alignment.center,
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
              ),
            ),
          ),
        ),
      );
    }

    Widget title() {
      return AnimationConfiguration.staggeredList(
        position: 1,
        duration: const Duration(milliseconds: 500),
        child: SlideAnimation(
          verticalOffset: 50.0,
          child: FadeInAnimation(
            child: Container(
              margin: const EdgeInsets.only(top: 19.75, left: 30),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
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
                      context.read<AuthCubit>().SignUp(
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
                    child: const Text(
                      'continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.25,
                        fontWeight: FontWeight.w600,
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
                top: 25,
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
                top: 10,
                left: 15,
                right: 15,
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SocialItems(
                      Social(
                        id: 1,
                        imageUrl: 'assets/facebook.png',
                      ),
                    ),
                    SocialItems(
                      Social(
                        id: 2,
                        imageUrl: 'assets/google.png',
                      ),
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
        position: 8,
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PhoneNumberPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Color(0xff80848A),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/SignInPage');
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
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
            title(),
            emailInput(),
            passwordInput(),
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
