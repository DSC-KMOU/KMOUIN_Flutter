import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuListInfo extends StatelessWidget {
  final List<dynamic> menuTable;

  const MenuListInfo({
    Key key,
    @required this.menuTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fullwidth = MediaQuery.of(context).size.width;
    double fullheight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,width: fullwidth,height:fullheight ,allowFontScaling: false);
    List<dynamic> list = menuTable;
    ListView myList = new ListView.builder(
        primary: false,
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    list[index]["menu"],
                    style: TextStyle(
                      color: const Color(0xff131415),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                  ),
                  Text(
                    list[index]["price"] == "" ? "￦ 0" : list[index]["price"],
                    style: TextStyle(
                      color: const Color(0xff131415),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: ScreenUtil().setSp(16),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
    return myList;
  }
}
