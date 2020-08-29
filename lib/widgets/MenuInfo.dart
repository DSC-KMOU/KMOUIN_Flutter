import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuInfo extends StatelessWidget {
  final List<dynamic> menuTable;

  const MenuInfo({
    Key key,
    @required this.menuTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double fullHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context, width: fullWidth, height: fullHeight, allowFontScaling: false);
    List<dynamic> list = menuTable;
    ListView myList = new ListView.builder(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Text(
                list[index],
                style: TextStyle(
                  color: const Color(0xff131415),
                  fontWeight: FontWeight.w300,
                  fontFamily: "NotoSansKR",
                  fontStyle: FontStyle.normal,
                  fontSize: ScreenUtil().setSp(16),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          );
        });
    return myList;
  }
}
