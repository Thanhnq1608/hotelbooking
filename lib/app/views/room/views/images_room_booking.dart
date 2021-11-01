import 'package:flutter/material.dart';

class ImagesRoom extends StatelessWidget {
  const ImagesRoom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        width: MediaQuery.of(context).size.width,
        height: 210,
        child: Image.network(
          'https://vnn-imgs-f.vgcloud.vn/2020/06/09/11/phong-khach-san-1.jpg',
          fit: BoxFit.cover,
        ));
  }
}
