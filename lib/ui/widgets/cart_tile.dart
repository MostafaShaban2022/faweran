import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final double price;
  final String model;
  final int numbers;
  final String title;

  const CartTile({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.model,
    required this.numbers,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ]),
      child: Padding(
        padding: const EdgeInsets.only(right: 11.5, left: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Image.asset(
                imageUrl,
                height: 105,
                width: 105,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 47.5,
                ),
                Text(
                  name, // Use the provided name
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '\$$price', // Use the provided price
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 1.5,
                ),
                Text(
                  'Model: $model',
                  style: const TextStyle(
                      color: Color(0xff868D94),
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis),
                ),
                Row(
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: 15,
                      width: 15,
                      decoration: const BoxDecoration(
                        color: Color(0xffE41937),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/check.png',
                          height: 11.75,
                          width: 11.75,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 65,
                ),
                Row(
                  children: [
                    Container(
                      height: 30,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: .85,
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icons8-delete-32.png',
                          height: 16,
                          width: 16,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Container(
                      height: 30,
                      width: 42.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 2.25),
                              child: Image.asset(
                                'assets/Arrow.png',
                                height: 12,
                                width: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              '1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Image.asset(
                  'assets/add to cart.png',
                  height: 37.5,
                  width: 37.5,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
