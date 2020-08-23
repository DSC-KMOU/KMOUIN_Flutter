import 'package:flutter/material.dart';

class BusRoute extends StatelessWidget {
  // BusInfo(
  //  title: "통근버스 1호차"
  //  info: "서면/구서동"
  // )
  final String title;
  final String info;
  const BusRoute({Key key, @required this.title, @required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.0,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 22.0,
                  letterSpacing: -1.0,
                  color: Color(0xff131415),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(info,
                  style: TextStyle(
                    fontSize: 12.0,
                    letterSpacing: -1.0,
                    color: Color(0xff787878),
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
          Spacer(),
          SizedBox(
              width: 68.0,
              height: 50.0,
              child: Stack(
                children: <Widget>[
                  Image.asset('images/BusPage/commuterbus.png'),

                ],
              ))
        ],
      ),
    );
  }
}