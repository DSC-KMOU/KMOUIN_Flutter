import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const MenuCard(
      {Key key, @required this.title, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 355,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x80cacaca),
            offset: Offset(0, -1),
            blurRadius: 16,
            spreadRadius: 2,
          )
        ],
        color: const Color(0xffffffff),
      ),
      child: Column(
        children: <Widget>[
          Text(title,
              style: const TextStyle(
                  color: const Color(0xff131415),
                  fontWeight: FontWeight.w500,
                  fontFamily: "NotoSansKR",
                  fontStyle: FontStyle.normal,
                  fontSize: 24.0),
              textAlign: TextAlign.center),
          SizedBox(
            height: 7,
          ),
          Container(
            width: 319,
            height: 1,
            decoration: BoxDecoration(
              color: const Color(0xffc53786),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Column(
            children: children,
          )
        ],
      ),
    );
  }
}
