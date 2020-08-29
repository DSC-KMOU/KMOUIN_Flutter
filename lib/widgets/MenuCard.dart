import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final double width;
  final double dividerWidth;

  const MenuCard(
      {Key key,
      @required this.title,
      @required this.children,
      this.width,
      this.dividerWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: fullWidth, height: fullHeight, allowFontScaling: false);
    return Container(
      padding: EdgeInsets.all(16),
      width: width,
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
              style: TextStyle(
                color: const Color(0xff131415),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(24),
              ),
              textAlign: TextAlign.center),
          SizedBox(
            height: 7,
          ),
          Container(
            width: dividerWidth,
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
