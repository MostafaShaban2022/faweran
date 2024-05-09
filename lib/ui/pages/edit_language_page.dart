import 'package:flutter/material.dart';

class EditLanguagePage extends StatelessWidget {
  const EditLanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 35, left: 8.75, right: 100),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/arrow_left.png',
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    'Language',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 35, right: 15, left: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Suggested',
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 22.5,
          ),
          Row(
            children: [
              const Text(
                'Arabic',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: const Color(
                      0xffE41937,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Text(
                'English (UK)',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.25,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xffE41937),
                  border: Border.all(
                    color: const Color(0xffE41937),
                  ),
                ),
              )
            ],
          ),
        ]),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
