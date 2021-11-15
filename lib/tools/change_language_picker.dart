import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguagePicker extends StatefulWidget {
  const ChangeLanguagePicker({Key key}) : super(key: key);

  @override
  _ChangeLanguagePicker createState() => _ChangeLanguagePicker();
}

class _ChangeLanguagePicker extends State<ChangeLanguagePicker> {
  final _items = ['Vietnamese','English'];
  String _currentLanguage;
  @override
  void initState() {
    _currentLanguage = _items[1];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  highlightColor: Colors.transparent,
                  splashRadius: 20,
                  onPressed: () {
                    Get.close(0);
                  },
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.close_rounded)),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Language',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              InkWell(
                child: Text(
                  'Xong',
                  style: TextStyle(fontSize: 15, color: Colors.blue.shade600),
                ),
                onTap: () {
                  Get.back(result: _currentLanguage);
                },
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    for (int i = 0; i < _items.length; i++)
                      ListTile(
                        title: Text(
                          _items[i],
                          style: TextStyle(fontSize: 17),
                        ),
                        leading: Radio(
                            value: _items[i],
                            groupValue: _currentLanguage,
                            onChanged: ((val) {
                              setState(() {
                                _currentLanguage = _items[i];
                              });
                            })),
                      )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
