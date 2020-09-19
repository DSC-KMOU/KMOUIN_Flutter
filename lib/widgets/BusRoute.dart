import "package:flutter/material.dart";

class BusRoute extends StatelessWidget {
  final String title;
  final String info;
  const BusRoute({Key key, @required this.title, @required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    return Container(
      width: fullWidth * 0.947,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  letterSpacing: -1.0,
                  color: Color(0xff131415),
                  fontWeight: FontWeight.w500,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:4.0),
                child: Text(info,
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: -1.0,
                      color: Color(0xff787878),
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
              width: 68.0,
              height: 50.0,
              child: Stack(
                children: <Widget>[
                  Image.asset("images/BusPage/commuterbus.png"),

                ],
              ))
        ],
      ),
    );
  }
}