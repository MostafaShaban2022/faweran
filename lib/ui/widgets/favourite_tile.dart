import 'package:faweran/models/favourite_model.dart';
import 'package:flutter/material.dart';

class FavouriteTile extends StatelessWidget {
  final Favourite favourite;
  const FavouriteTile(this.favourite, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                favourite.imageUrl,
                width: 160,
                height: 165,
              ),
              Column(
                children: [
                  Container(
                    height: 26,
                    width: 26,
                    margin: const EdgeInsets.only(top: 12, left: 127.5),
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
                  Container(
                    height: 15,
                    width: 35,
                    margin: const EdgeInsets.only(top: 96.5, left: 120.5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/icon_star.png',
                            width: 15,
                            color: Colors.red,
                          ),
                          const Text(
                            '4.4',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ), //
            ],
          ),
          Text(
            favourite.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          Row(
            children: [
              Text(
                '\$${favourite.price}',
                style: const TextStyle(
                  color: Color(0xffFA254C),
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '\$${favourite.discount}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '\$${favourite.percent}',
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            favourite.title,
            style: const TextStyle(
              color: Color(0xff868D94),
              fontSize: 14.25,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Row(
            children: [
              SizedBox(
                height: 30,
                width: 105,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Add To Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 7.5,
              ),
              Image.asset(
                'assets/btn_wishlist_active.png',
                height: 30,
                width: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
