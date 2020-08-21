import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuInfo extends StatelessWidget {
  final List<dynamic> menuTable;
  final int length;

  const MenuInfo(
      {Key key,
      @required this.menuTable,
      @required this.length,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new ListView(
          children: new List.generate(
            length,
            (index) => Column(
              children: <Widget>[
                SizedBox(
                  height: 12,
                ),
                Text(menuTable[index],
                  style: const TextStyle(
                    color: const Color(0xff131415),
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
