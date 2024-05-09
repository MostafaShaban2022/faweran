import 'package:faweran/models/picks_tile.dart';
import 'package:faweran/ui/pages/cart_page.dart';
import 'package:faweran/ui/pages/electronics_content.dart';
import 'package:faweran/ui/pages/fashion_page.dart';
import 'package:faweran/ui/pages/home_kitchen_content.dart';
import 'package:faweran/ui/pages/home_page.dart';
import 'package:faweran/ui/pages/mobiles_accessories_content.dart';
import 'package:faweran/ui/pages/search_page.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  String selectedCategory = '';
  late Widget displayedContent;

  final List<String> categoryList = [
    'Home & Kitchen',
    'Mobiles & Accessories',
    'Electronics',
    "Men's Fashion",
    "Women's Fashion",
    'Gift Cards',
    'Appliances',
    'Grocery',
    'Laptop & Accessories',
    'Fragrance',
    'Baby',
    'Sports & Outdoors',
    'Watches & Jewelry',
    'Work from \nHome',
  ];

  final Map<String, Widget> categoryContentMap = {
    'Home & Kitchen': const HomeKitchenContent(),
    'Mobiles & Accessories': const MobilesAccessoriesContent(),
    'Electronics': const ElectronicsContent(),
    // "Men's Fashion": const MenFashionContent(),
    // "Women's Fashion": const WomenFashionContent(),
    // 'Gift Cards': const GiftCardsContent(),
    // 'Appliances': const AppliancesContent(),
    // 'Grocery': const GroceryContent(),
    // 'Laptop & Accessories': const LaptopsAccessoriesContent(),
    // 'Fragrance': const FragranceContent(),
    // 'Baby': const BabyContent(),
    // 'Sports & Outdoors': const SportsOutdoorsContent(),
    // 'Watches & Jewelry': const WatchesJewelryContent(),
    // 'Work from Home': const WorkFromHomeContent(),
  };

  final List<List<Picks>> topPicksList = [
    [
      Picks(id: 1, name: 'Electronics', imageUrl: 'assets/apple10.jpg'),
      Picks(id: 2, name: 'Appliances', imageUrl: 'assets/airfryer.jpg'),
      Picks(id: 3, name: 'Mobiles', imageUrl: 'assets/mobilles.jpg'),
    ],
    [
      Picks(id: 4, name: "Men's Fashion", imageUrl: 'assets/men.jpg'),
      Picks(id: 5, name: "Women", imageUrl: 'assets/apple10.jpg'),
      Picks(id: 6, name: 'Fragrance', imageUrl: 'assets/perfume.jpg'),
    ],
    [
      Picks(id: 7, name: 'Video Games', imageUrl: 'assets/psss5.jpg'),
      Picks(id: 8, name: 'Tablets', imageUrl: 'assets/tap.jpg'),
      Picks(id: 9, name: 'Laptops', imageUrl: 'assets/lap.jpg'),
    ],
  ];

  @override
  void initState() {
    super.initState();
    displayedContent = Container();
  }

  void updateContent(int index) {
    setState(() {
      selectedCategory = categoryList[index];
      if (categoryContentMap.containsKey(selectedCategory)) {
        displayedContent = categoryContentMap[selectedCategory]!;
      } else {
        displayedContent = Text(
          selectedCategory,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        );
      }
    });
  }

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

  Widget category() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 105,
              height: 539.92,
              decoration: const BoxDecoration(
                color: Color(0xffFFE0E4),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                ),
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.5),
                    for (int i = 0; i < categoryList.length; i++)
                      Center(
                        child: Center(
                          child: buildCategoryText(categoryList[i], i),
                        ),
                      ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            displayedContent,
          ],
        ),
      ),
    );
  }

  Widget buildCategoryText(String text, int index) {
    return GestureDetector(
      onTap: () => updateContent(index),
      child: selectedCategory != text
          ? SizedBox(
              height: 30,
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          : Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffF5F5F5),
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                header(),
                category(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: 1,
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
            icon: Image.asset(
              'assets/Palette1.png',
              height: 24,
              width: 24,
              color: const Color(0xffE41937),
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
    );
  }
}
