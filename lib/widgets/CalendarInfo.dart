import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarInfo extends StatelessWidget {
  final List<dynamic> calendarTable;

  const CalendarInfo({
    Key key,
    @required this.calendarTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fullwidth = MediaQuery.of(context).size.width;
    double fullheight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context,width: fullwidth,height:fullheight ,allowFontScaling: false);
    List<dynamic> list = calendarTable;
    ListView myList = new ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      list[index]["date"]["year"].toString()+"년\t"+list[index]["date"]["month"].toString()+"월\t"+list[index]["date"]["day"].toString()+"일",
                      style: TextStyle(
                        color: const Color(0xff131415),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: ScreenUtil().setSp(16),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 8.0),
                    width: fullwidth*0.6,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        list[index]["calendar"],
                        style: TextStyle(
                          color: const Color(0xff131415),
                          fontWeight: FontWeight.w300,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: ScreenUtil().setSp(16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,height: 5,
              ),
            ],
          );
        });
    return myList;
  }
}
