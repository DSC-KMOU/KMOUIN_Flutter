import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BusCard extends StatelessWidget {
  final String title;
  final double width;
  final List<Widget> children;

  const BusCard({Key key, @required this.title, @required this.width, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,width: 625,height:1353 ,allowFontScaling: false);
    return Container(
      padding: EdgeInsets.only(
        left: width * 0.042,
        right: width * 0.039,
        top: 12,
        bottom: 22,
      ),
      width: width,

      // height: 185,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: const Color(0xff131415),
              fontWeight: FontWeight.w600,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              fontSize: ScreenUtil().setSp(28),
            ),
          ),
          Divider(
            thickness: 1,
            color: const Color(0xff842fb5),
          ),
          SizedBox(height: 3.0),
          Column(
            children: children,
          ),
        ],
      ),
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
    );
  }
}