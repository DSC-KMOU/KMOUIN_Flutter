import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorContainer extends StatelessWidget {
  ErrorContainer({
    @required this.imageName,
    @required this.reportTitle,
    @required this.reportDescription,
    this.url,
    this.page,
  });

  final String imageName;
  final String reportTitle;
  final String reportDescription;
  final url;
  final page;

  @override
  Widget build(BuildContext context) {
    double _mainWidth = MediaQuery.of(context).size.width;
    double _mainHeight = MediaQuery.of(context).size.height;
    double _marginHeight = _mainHeight * (2.5 / 100);
    double _containerHeight = _mainHeight * (11.1 / 100);
    double _containerWidth = _mainWidth * (88.0 / 100);
    double _iconSize = _containerHeight * (27.8 / 100);

    ScreenUtil.init(context,
        width: _mainWidth, height: _mainHeight, allowFontScaling: false);

    return Container(
        margin: EdgeInsets.only(
          top: _marginHeight,
        ),
        child: FlatButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
          onPressed: () {
            if(page!=null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => page,
                ),
              );
            }
            else{
              _launchURL(url);
            };
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(
                    left: _iconSize,
                  ),
                  width: _iconSize,
                  child: Image.asset(
                    'images/ErrorAndDev/$imageName@3x.png',
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: _iconSize),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // 오류제보
                      Text(reportTitle,
                          style: TextStyle(
                              color: Color(0xff131415),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(24.0)),
                          textAlign: TextAlign.center),
                      // 버그나 피드백 부탁드립니다!
                      Text(reportDescription,
                          style: TextStyle(
                              color: Color(0xff5f605f),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: ScreenUtil().setSp(12.0)),
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        width: _containerWidth,
        height: _containerHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  color: const Color(0x80cacaca),
                  offset: Offset(0, -1),
                  blurRadius: 16,
                  spreadRadius: 2)
            ],
            color: Colors.white));
  }
}

_launchURL(FeedUrl) async {
  var url = FeedUrl;

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
