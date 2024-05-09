import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:faweran/models/categories_models.dart';
import 'package:faweran/models/product_model.dart';
import 'package:faweran/ui/pages/cart_page.dart';
import 'package:faweran/ui/pages/categories_page.dart';
import 'package:faweran/ui/pages/favourite_page.dart';
import 'package:faweran/ui/pages/home_page.dart';
import 'package:faweran/ui/pages/notifi_page.dart';
import 'package:faweran/ui/pages/search_page.dart';
import 'package:faweran/ui/widgets/categories_tile.dart';
import 'package:faweran/ui/widgets/product_tile.dart';
import 'package:flutter/material.dart';

class FashionPage extends StatelessWidget {
  const FashionPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppBar header() {
      return AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, right: 1),
                      height: 40,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: 37.5),
                          hintText: 'Search here ...',
                          hintStyle: const TextStyle(
                            color: Color(0xffC8C8CB),
                            fontSize: 12,
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
                                  ));
                            },
                            child: const Icon(
                              Icons.search,
                              size: 20,
                              color: Color(0xffC8C8CB),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavouritePage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/btn_wishlist.png',
                        width: 37.5,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 14),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotifiPage(),
                          ),
                        );
                      },
                      child: Image.asset(
                        'assets/notification.png',
                        height: 26,
                        width: 26,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                margin: const EdgeInsets.only(right: 57.75),
                height: 36.5,
                width: 297.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffF5F5F5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/location-pin.png',
                      width: 15.75,
                      height: 15.75,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'My Position :Tanta City, Gharbia, Egypt',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image.asset(
                      'assets/Arrow.png',
                      width: 18,
                      height: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 110.0,
      );
    }

    Widget backGroundContent() {
      return Container(
        margin: const EdgeInsets.only(top: 7),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 155,
            enableInfiniteScroll: true,
            viewportFraction: 1.0,
            aspectRatio: 16 / 9,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
          ),
          items: [
            Container(
              color: Colors.black,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.5),
                    child: Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 33.5,
                            ),
                            Text(
                              '40%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'discount',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 29.7,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'NEW COLLECTION WITH',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 192.5,
                        ),
                        Image.asset(
                          'assets/pngimg 2.png',
                          height: 140,
                          width: 72.5,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: DotsIndicator(
                      dotsCount: 2,
                      position: 0,
                      decorator: DotsDecorator(
                        size: const Size.square(8.0),
                        activeSize: const Size(12.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        activeColor: Colors.blue,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: const Color(0xffF31E1E),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 13.5),
                    child: Row(
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 33.5,
                            ),
                            Text(
                              '40%',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'discount',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 29.7,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              'NEW COLLECTION WITH',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 192.5,
                        ),
                        Image.asset(
                          'assets/pngimg 5.png',
                          height: 140,
                          width: 72.5,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: DotsIndicator(
                      dotsCount: 2,
                      position: 1,
                      decorator: DotsDecorator(
                        size: const Size.square(8.0),
                        activeSize: const Size(12.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        activeColor: Colors.blue,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget categoriesTitle() {
      return Container(
        margin: const EdgeInsets.only(top: 11, left: 21, right: 21),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Category',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              ' See All',
              style: TextStyle(
                color: Color(0xff80848A),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
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
                      imageUrl: 'assets/dd.png',
                      title: 'Watches',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 2,
                      imageUrl: 'assets/Ellipse 196.png',
                      title: 'Shirts',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 3,
                      imageUrl: 'assets/dd.png',
                      title: 'Tv',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 4,
                      imageUrl: 'assets/Ellipse 196.png',
                      title: 'Laptops',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 5,
                      imageUrl: 'assets/dd.png',
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
                      imageUrl: 'assets/photo2.png',
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
                      imageUrl: 'assets/Ellipse 196.png',
                      title: 'Mobiles',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 2,
                      imageUrl: 'assets/dd.png',
                      title: 'Video Games',
                    )),
                    const SizedBox(width: 22),
                    CategoriesTile(Categories(
                      id: 3,
                      imageUrl: 'assets/dd.png',
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

    Widget products() {
      return Container(
        margin: const EdgeInsets.only(
          top: 30,
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                  width: 11,
                ),
                ProductTile(
                  Product(
                    id: 1,
                    imageUrl: 'assets/Rectangle 50.png',
                    name: 'Iphone 15 pro max',
                    title: 'Mobiles',
                    price: 1250,
                    dicount: 1400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 43,
            ),
            Row(
              children: [
                ProductTile(
                  Product(
                    id: 1,
                    imageUrl: 'assets/llllllll.png',
                    name: 'Iphone 15 pro max',
                    title: 'Mobiles',
                    price: 1250,
                    dicount: 1400,
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                ProductTile(
                  Product(
                    id: 1,
                    imageUrl: 'assets/llllllll.png',
                    name: 'Iphone 15 pro max',
                    title: 'Mobiles',
                    price: 1250,
                    dicount: 1400,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 43,
            ),
            Row(
              children: [
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
                  width: 11,
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
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            backGroundContent(),
            categoriesTitle(),
            categories(),
            products(),
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
          currentIndex: 2,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Image.asset(
                  'assets/home1.png',
                  width: 67.5,
                  height: 24,
                ),
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
              icon: Image.asset(
                'assets/brand 1.png',
                height: 24,
                width: 60,
                color: const Color(0xffE41937),
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
