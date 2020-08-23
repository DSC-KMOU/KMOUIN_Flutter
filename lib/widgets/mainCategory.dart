import 'package:flutter/material.dart';
import 'package:kmouin/main.dart';
import '../widgets/mainPageData.dart';

class CategoryCards extends StatelessWidget {
  CategoryCards({
    @required this.logoContainer,
    @required this.containerTitle,
    @required this.containerDescription,
    @required this.order,
  });

  final int order;
  final logoContainer;
  final String containerTitle;
  final String containerDescription;

  @override
  Widget build(BuildContext context) {

    void scopeOut(){
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    double _mainWidth = MediaQuery.of(context).size.width;
    double _containerSize = _mainWidth * (42.0/100);
    double _marginSize = _mainWidth * (2.0/100);

    return Container(
      margin: EdgeInsets.all(_marginSize),
      width: _containerSize,
      height: _containerSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x80cacaca),
            offset: Offset(0, -1),
            blurRadius: 16,
            spreadRadius: 2,
          ),
        ],
        color: const Color(0xffffffff),
      ),
      child: FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.all(0.0),
        onPressed: () {
          scopeOut();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => category[order-1],
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logoContainer,
            // 버스 정보
            Text(
              containerTitle,
              style: const TextStyle(
                color: const Color(0xff131415),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),
            // 실시간 위치를 알 수 있어요
            Text(
              containerDescription,
              style: const TextStyle(
                color: const Color(0xff5f605f),
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: 12.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
