import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ErrorContainer extends StatelessWidget {
  ErrorContainer({
    @required this.imageName,
    @required this.reportTitle,
    @required this.reportDescription,
    this.url,
  });

  final String imageName;
  final String reportTitle;
  final String reportDescription;
  final url;

  @override
  Widget build(BuildContext context) {
    double _mainWidth = MediaQuery.of(context).size.width;
    double _mainHeight = MediaQuery.of(context).size.height;
    double _marginHeight = _mainHeight * (2.5/100);
    double _containerHeight = _mainHeight * (11.1/100);
    double _containerWidth = _mainWidth * (88.0/100);
    double _iconSize = _containerHeight * (27.8/100);

    return Container(
        margin: EdgeInsets.only(
          top: _marginHeight,
        ),
        child: FlatButton(
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0),
          ),
          onPressed: () {
            _launchURL(url);
          },
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: _iconSize,),
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
                          style: const TextStyle(
                              color: const Color(0xff131415),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 24.0),
                          textAlign: TextAlign.center),
                      // 버그나 피드백 부탁드립니다!
                      Text(reportDescription,
                          style: const TextStyle(
                              color: const Color(0xff5f605f),
                              fontWeight: FontWeight.w500,
                              fontFamily: "NotoSansKR",
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0),
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
