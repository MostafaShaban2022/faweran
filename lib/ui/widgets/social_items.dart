import 'package:faweran/models/social_model.dart';
import 'package:flutter/material.dart';

class SocialItems extends StatelessWidget {
  final Social social;

  const SocialItems(this.social, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 105,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Center(
        child: Row(
          children: [
            Image.asset(
              social.imageUrl,
              width: 26,
              height: 27,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
