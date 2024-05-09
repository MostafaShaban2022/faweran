import 'package:carousel_slider/carousel_slider.dart';
import 'package:faweran/models/categories_models.dart';
import 'package:faweran/models/product_model.dart';
import 'package:faweran/ui/pages/cart_page.dart';
import 'package:faweran/ui/pages/categories_page.dart';
import 'package:faweran/ui/pages/fashion_page.dart';
import 'package:faweran/ui/pages/product_sort_page.dart';
import 'package:faweran/ui/pages/search_page.dart';
import 'package:faweran/ui/widgets/categories_tile.dart';
import 'package:faweran/ui/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 37.5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 20),
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 37.5),
                    hintText: 'What are you looking for ?',
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: const BorderSide(
                        color: Color(0xffE41937),
                      ),
                    ),
                    prefixIcon: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.search,
                        size: 24,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget backGroundContent() {
      return Container(
        height: 155,
        width: 500,
        margin: const EdgeInsets.only(top: 10),
        child: Stack(children: [
          CarouselSlider(
            items: [
              Image.asset('assets/banner.png', fit: BoxFit.cover),
              Image.asset('assets/banner1.png', fit: BoxFit.cover),
              Image.asset(
                'assets/Model3.jpg',
                fit: BoxFit.cover,
              ),
              Image.asset('assets/banner.jpg', fit: BoxFit.cover),
            ],
            options: CarouselOptions(
              height: 350,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
          ),
          Positioned(
            bottom: 12.75,
            left: 0,
            right: 0,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      height: 4,
                      width: 20,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        color: _currentPage == i ? Colors.red : Colors.blueGrey,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ]),
      );
    }

    Widget categories() {
      return Container(
        margin: const EdgeInsets.only(top: 6),
        child: Padding(
          padding: const EdgeInsets.only(right: 21, left: 21),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesTile(Categories(
                      id: 1,
                      imageUrl: 'assets/photo7.png',
                      title: 'Video Games',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 2,
                      imageUrl: 'assets/photo6.png',
                      title: 'Chaies',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 3,
                      imageUrl: 'assets/photo3.png',
                      title: 'Tv',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 4,
                      imageUrl: 'assets/photo4.png',
                      title: 'Laptops',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 5,
                      imageUrl: 'assets/photo5.png',
                      title: 'Shoes',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 6,
                      imageUrl: 'assets/photo2.png',
                      title: 'Mobiles',
                    )),
                    const SizedBox(width: 5),
                    CategoriesTile(Categories(
                      id: 7,
                      imageUrl: 'assets/photo.png',
                      title: 'Food',
                    )),
                    const SizedBox(width: 7),
                    CategoriesTile(
                      Categories(
                        id: 8,
                        imageUrl: 'assets/photo8.png',
                        title: 'Books',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesTile(Categories(
                      id: 1,
                      imageUrl: 'assets/photo2.png',
                      title: 'Mobiles',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 2,
                      imageUrl: 'assets/photo7.png',
                      title: 'Video Games',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 3,
                      imageUrl: 'assets/photo3.png',
                      title: 'Tv',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 4,
                      imageUrl: 'assets/photo4.png',
                      title: 'Laptops',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 5,
                      imageUrl: 'assets/photo5.png',
                      title: 'Mobiles',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 6,
                      imageUrl: 'assets/photo6.png',
                      title: 'Mobiles',
                    )),
                    const SizedBox(width: 5),
                    CategoriesTile(Categories(
                      id: 7,
                      imageUrl: 'assets/photo.png',
                      title: 'Mobiles',
                    )),
                    const SizedBox(width: 7),
                    CategoriesTile(
                      Categories(
                        id: 8,
                        imageUrl: 'assets/photo8.png',
                        title: 'Mobiles',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget related() {
      return Container(
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Checked Products',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.75,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductSortPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    ProductTile(
                      Product(
                        id: 1,
                        imageUrl: 'assets/addddd.png',
                        name: 'Iphone 15 pro max',
                        title: 'Mobiles',
                        price: 1250,
                        dicount: 1400,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ProductTile(
                      Product(
                        id: 2,
                        imageUrl: 'assets/Rectangle 50.png',
                        name: 'Iphone 15 pro max',
                        title: 'Mobiles',
                        price: 1250,
                        dicount: 1400,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ProductTile(
                      Product(
                        id: 3,
                        imageUrl: 'assets/llllllll.png',
                        name: 'Iphone 15 pro max',
                        title: 'Mobiles',
                        price: 1250,
                        dicount: 1400,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ProductTile(
                      Product(
                        id: 4,
                        imageUrl: 'assets/llllllll.png',
                        name: 'Iphone 15 pro max',
                        title: 'Mobiles',
                        price: 1250,
                        dicount: 1400,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget accessoires() {
      return Container(
        margin: const EdgeInsets.only(top: 15, left: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Accessoires',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/apple10.jpg',
                        width: 171,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Taplet',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/nav.jpg',
                        width: 171,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Headphones',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/apple10.jpg',
                        width: 171,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Taplet',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/apple10.jpg',
                        width: 171,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Taplet',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            backGroundContent(),
            categories(),
            related(),
            accessoires(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(
            color: Color(0xff484C52),
            fontSize: 11.5,
            fontWeight: FontWeight.w400,
          ),
          selectedLabelStyle: const TextStyle(
            color: Color(0xffE41937),
            fontSize: 13.5,
            fontWeight: FontWeight.w700,
          ),
          selectedItemColor: const Color(0xffE41937),
          unselectedItemColor: const Color(0xff484C52),
          type: BottomNavigationBarType.fixed,
          currentIndex: 0,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/home-2.png',
                width: 67.5,
                height: 24,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoriesPage(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/Palette1.png',
                  height: 24,
                  width: 24,
                ),
              ),
              label: 'categories',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FashionPage(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/brand 1.png',
                  height: 24,
                  width: 60,
                ),
              ),
              label: 'Fashion',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/Cart1.png',
                  height: 24,
                  width: 24,
                ),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/ProfilePage');
                },
                child: Image.asset(
                  'assets/User1.png',
                  height: 24,
                  width: 24,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
