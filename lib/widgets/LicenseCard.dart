import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LicenseCard extends StatelessWidget {
  LicenseCard({
    @required this.licenseTitle,
    @required this.licenseDescription,
    @required this.licenseCardWidth,
  });

  final licenseTitle;
  final licenseDescription;
  final licenseCardWidth;

  @override
  Widget build(BuildContext context) {
    double _mainWidth = MediaQuery.of(context).size.width;
    double _mainHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,
        width: _mainWidth, height: _mainHeight, allowFontScaling: false);
    return Center(
      child: Container(
        padding: EdgeInsets.all(
          10.0,
        ),
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 16,
                  spreadRadius: 2)
            ],
            color: const Color(0xffffffff)),
        width: licenseCardWidth,
        child: Column(
          children: [
            Text(
              licenseTitle,
              style: TextStyle(fontSize: ScreenUtil().setSp(14.0)),
            ),
            Divider(
              color: Colors.black54,
              thickness: 1.0,
            ),
            Text(
              licenseDescription,
              style: TextStyle(fontSize: ScreenUtil().setSp(10.0)),
            )
          ],
        ),
      ),
    );
  }
}
