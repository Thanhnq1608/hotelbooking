import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesRoom extends StatelessWidget {
  final String type;
  final List<String> imageList;
  ImagesRoom({this.imageList, this.type});
  List<String> picture = [
    "https://tripi.vn/cdn-cgi/image/width=640,height=640/https://storage.googleapis.com/hms_prod/photo/img/1621182005719ol/129149157.jpg",
    "https://tripi.vn/cdn-cgi/image/width=640,height=640/https://storage.googleapis.com/hms_prod/photo/img/1621182006091Xa/246745329.jpg",
    "https://tripi.vn/cdn-cgi/image/width=640,height=640/https://storage.googleapis.com/hms_prod/photo/img/1621182006099Gc/208585792.jpg",
    "https://tripi.vn/cdn-cgi/image/width=640,height=640/https://storage.googleapis.com/hms_prod/photo/img/1621181509180fw/248126761.jpg"
  ];
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
          items: type == 'book multiple rooms'
              ? picture
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
                  .toList()
              : imageList
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
                  .toList()),
    );
  }
}
