import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class TransformLating extends StatefulWidget {
  const TransformLating({super.key});

  @override
  State<TransformLating> createState() => _TransformLatingState();
}

class _TransformLatingState extends State<TransformLating> {
  String placeM = '';
  String addressOnScreen = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.teal],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(addressOnScreen),
              Text(placeM),
              GestureDetector(
                onTap: () async {
                  List<Location> location =
                      await locationFromAddress('United States Of America');
                  List<Placemark> placemark = await placemarkFromCoordinates(
                      40.788625526133245, -74.01335145304685);
                  setState(() {
                    placeM =
                        '${placemark.reversed.last.country} ${placemark.reversed.last.locality}';
                    addressOnScreen =
                        '${location.last.latitude}${location.last.longitude}';
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Hit To Conver',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
