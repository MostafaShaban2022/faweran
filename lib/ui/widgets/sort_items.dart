import 'package:faweran/models/sorts_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SortItems extends StatelessWidget {
  final Sorts sorts;
  const SortItems(this.sorts, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27.5,
      width: 75,
      decoration: BoxDecoration(
        color: const Color(0xffFFF0F4),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: const Color(0xffF5F5F5),
        ),
      ),
    );
  }
}
