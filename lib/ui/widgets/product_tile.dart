import 'package:faweran/models/product_model.dart';
import 'package:faweran/ui/pages/product_page.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProductPage(),
              ),
            );
          },
          child: Container(
            height: 225,
            color: Colors.white,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  Image.asset(
                    product.imageUrl,
                    height: 148,
                    width: 145,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 120,
                    top: 122,
                    child: Container(
                      height: 17.5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.35),
                            spreadRadius: 1.2,
                            blurRadius: 1.2,
                            offset: const Offset(0, 1.2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star.png',
                            width: 16.75,
                            color: Colors.red,
                          ),
                          const Text(
                            '4.4',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), //
                  Container(
                    height: 26,
                    width: 26,
                    margin: const EdgeInsets.only(top: 2.5, left: 137.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.35),
                          spreadRadius: 1.2,
                          blurRadius: 1.2,
                          offset: const Offset(0, 1.2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/add to cart.png',
                        width: 21.5,
                        height: 21.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, top: 1.5),
                    child: Image.asset(
                      'assets/add to cart.png',
                      width: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 7.5,
                  ),
                  Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      color: Color(0xffFA254C),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '\$${product.dicount}',
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.lineThrough),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 3.5,
                    ),
                    Text(
                      product.name,
                      style: const TextStyle(
                        color: Color(0xff868D94),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
