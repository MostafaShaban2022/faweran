import 'package:carousel_slider/carousel_slider.dart';
import 'package:faweran/models/photo_model.dart';
import 'package:faweran/ui/widgets/photo_tile.dart';

import 'package:flutter/material.dart';

class PhotoDetail extends StatefulWidget {
  const PhotoDetail({Key? key}) : super(key: key);

  @override
  _PhotoDetailState createState() => _PhotoDetailState();
}

class _PhotoDetailState extends State<PhotoDetail> {
  final List<String> imageUrls = [
    'assets/MODEL1.jpg',
    'assets/model10.jpg',
    'assets/Model3.jpg',
    'assets/Modell.jpg',
    'assets/Model5.jpg',
  ];

  final CarouselController _carouselController = CarouselController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 35, left: 11, right: 11),
        child: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text(
                'CANCEL',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.5,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/coupon (2) 2.png',
              width: 92.5,
            )
          ],
        ),
      );
    }

    Widget backGround() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 27.5),
            child: Text(
              '${_currentPage + 1} of ${imageUrls.length}',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(
            height: 27.5,
          ),
          CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              height: 400.0,
              initialPage: 0,
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            items: imageUrls.map((imageUrl) {
              return Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              );
            }).toList(),
          ),
        ],
      );
    }

    Widget slide() {
      const double spacingWidth = 15.0; // Set your desired spacing width

      return Container(
        margin: const EdgeInsets.only(
          top: 17.75,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 12.5, right: 12.5),
            child: Row(
              children: List.generate(imageUrls.length, (index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _carouselController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: PhotoTile(
                        Photo(
                          id: index + 1,
                          imageUrl: imageUrls[index],
                        ),
                      ),
                    ),
                    if (index < imageUrls.length - 1)
                      const SizedBox(
                          width:
                              spacingWidth), // Add spacing between PhotoTiles
                  ],
                );
              }),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            backGround(),
            slide(),
          ],
        ),
      ),
    );
  }
}
