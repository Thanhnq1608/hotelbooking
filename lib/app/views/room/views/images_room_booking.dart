import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesRoom extends StatelessWidget {
  final List<String> imageList;
  ImagesRoom({this.imageList});

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(top: 16),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          enableInfiniteScroll: true,
          autoPlay: true,
        ),
        items: imageList
            .map((e) => ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    child: Image.network(
                      e,
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
