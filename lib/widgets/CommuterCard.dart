import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class CommuterCard extends StatelessWidget {
  final Widget cardtitle;
  final Widget cardcontent;
  final double width;

  const CommuterCard({
    Key key,
    @required this.cardtitle,
    this.cardcontent,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(
        left: width * 0.051,
        top: 19.0,
        right: width * 0.062,
        bottom: 22.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          cardtitle,
          Divider(
            color: Color(0xff842fb5),
            thickness: 1.0,
          ),
          cardcontent,
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          boxShadow: [
            BoxShadow(
                color: const Color(0x80cacaca),
                offset: Offset(0, -1),
                blurRadius: 16,
                spreadRadius: 2)
          ],
          color: const Color(0xffffffff)),
    );
  }
}
