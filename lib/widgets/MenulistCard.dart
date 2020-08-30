import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuListCard extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final double fullWidth;

  const MenuListCard(
      {Key key, @required this.title, @required this.children, this.fullWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fullwidth = MediaQuery.of(context).size.width;
    double fullheight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,width: fullwidth,height:fullheight ,allowFontScaling: false);
    return Container(
      margin: EdgeInsets.only(
        left: fullWidth * 0.06,
        bottom: 45.0,
        right: fullWidth * 0.06,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: fullWidth * 0.02),
            child: Text(
              title,
              style: TextStyle(
                color: const Color(0xff131415),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: ScreenUtil().setSp(24),
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
            endIndent: 5.0,
            color: Color(0xffc53786),
          ),
          Container(
            padding: EdgeInsets.only(
              left: fullWidth * 0.0186,
              top: 3.0,
              right: fullWidth * 0.0186,
            ),
            child: Column(
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
