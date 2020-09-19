import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class EvacuationList extends StatelessWidget {
  final List<String> tempList = ["a", "b", "c", "d", "e"];
  final List<String> tempCapList = ["A", "B", "C", "D", "E"];

  EvacuationList({
    @required this.num,
    @required this.screenHeight,
    @required this.width,
  });

  final int num;
  final double screenHeight;
  final double width;

  @override
  Widget build(BuildContext context) {
    List<Widget> zone = [
      Azone(screenHeight: screenHeight),
      Azone(screenHeight: screenHeight),
      Bzone(screenHeight: screenHeight),
      Czone(screenHeight: screenHeight),
      Dzone(screenHeight: screenHeight),
      Ezone(screenHeight: screenHeight),
    ];
    return Container(
      width: width,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: width * (7.5 / 100),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: screenHeight * (18.5 / 100),
                child: SingleChildScrollView(
                  child: zone[num],
                ),
              ),
              Text("내진설계구역",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.right),
              Container(
                height: screenHeight * (11 / 100),
                child: SingleChildScrollView(
                  child: earthQuakeResistant(num, screenHeight),
                ),
              ),
              // 지진대피가능 야외공간
              Text("지진대피가능 야외공간",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.right),
              Container(
                child: SingleChildScrollView(
                  child: earthQuakeEvacuation(num, screenHeight),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Ezone extends StatelessWidget {
  final double screenHeight;
  const Ezone ({
    Key key,@required this.screenHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("E zone",
            style: TextStyle(
              color: const Color(0xffee6a00),
              fontWeight: FontWeight.w500,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              fontSize: 14,
            ),
            textAlign: TextAlign.right),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            // E1 아치관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffee6a00),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "E1 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아치관")
            ])),
            _fiveten(screenHeight),
            // E2 누리관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffee6a00),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "E2 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "누리관")
            ])),
            _fiveten(screenHeight),
            // E3 전파암실동
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffee6a00),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "E3 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "전파암실동")
            ])),
            _fiveten(screenHeight),
            // E4 학생군사교육단
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffee6a00),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "E4 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "학생군사교육단")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            // E5 입지관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffee6a00),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "E5 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "입지관")
            ])),
            _fiveten(screenHeight),
            // EP1 아치해맞이길
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffee6a00),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "EP1 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아치해맞이길")
            ])),
            _fiveten(screenHeight),
            // EP2 아치노을길
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffee6a00),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "EP2 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아치노을길")
            ])),
          ],
        ),
      ],
    );
  }
}

class Dzone extends StatelessWidget {
  final double screenHeight;
  const Dzone ({
    Key key,@required this.screenHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("D zone",
            style: TextStyle(
              color: const Color(0xffff2d86),
              fontWeight: FontWeight.w500,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              fontSize: 14,
            ),
            textAlign: TextAlign.right),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                    color: const Color(0xffff2d86),
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0,
                  ),
                  text: "D1 "),
              TextSpan(
                  style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0,
                  ),
                  text: "해양과학기술대학관")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                    color: const Color(0xffff2d86),
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0,
                  ),
                  text: "D2 "),
              TextSpan(
                  style: const TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 12.0,
                  ),
                  text: "보트보관실")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffff2d86),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "D3 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "반도체실험동")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffff2d86),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "D4 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "시설서비스센터")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffff2d86),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "D5 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "대강당")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffff2d86),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "D6 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아라관")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffff2d86),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "D7 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "공동실험관")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffff2d86),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "D8 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "국제교류협력관")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffff2d86),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "DP1 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아치나루터")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffff2d86),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "DP2 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "북해안로")
            ]))
          ],
        ),
      ],
    );
  }
}

class Czone extends StatelessWidget {
  final double screenHeight;
  const Czone ({
    Key key,@required this.screenHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("C zone",
            style: TextStyle(
              color: const Color(0xff581efc),
              fontWeight: FontWeight.w500,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              fontSize: 14,
            ),
            textAlign: TextAlign.right),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            // C1 해사대학관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff581efc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "C1 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "해사대학관")
            ])),
            _fiveten(screenHeight),
            // C2 평생교육관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff581efc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "C2 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "평생교육관")
            ])),
            _fiveten(screenHeight),
            // C4 예섬관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff581efc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "C4 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "예섬관")
            ])),
            _fiveten(screenHeight),
            // C5 다솜관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff581efc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "C5 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "다솜관")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            // C6 해사대학 신관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff581efc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "C6 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "해사대학 신관")
            ])),
            _fiveten(screenHeight),
            // CP1 아치잔디공원
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff581efc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "CP1 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아치잔디공원")
            ])),
            _fiveten(screenHeight),
            // CP2 아치뜰
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff581efc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "CP2 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아치뜰")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            // CP3 아치해변
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff581efc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "CP3 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아치해변")
            ]))
          ],
        ),
      ],
    );
  }
}

class Bzone extends StatelessWidget {
  final double screenHeight;
  const Bzone({
    Key key,@required this.screenHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // B zone
        Text("B zone",
            style: TextStyle(
              color: const Color(0xff0033cc),
              fontWeight: FontWeight.w500,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              fontSize: 14,
            ),
            textAlign: TextAlign.right),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "B1 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "공과대학1관")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "B2 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "어울림관")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "B3 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "도서관")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "B4 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "미디어홀")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "B5 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "한바다호")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "B6 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "한나라호")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "BP1 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "해상교육장")
            ])),
            _fiveten(screenHeight),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "BP2 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "실습선부두")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            // BP3 어울림쉼터
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "BP3 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "어울림쉼터")
            ])),
            _fiveten(screenHeight),
            // BP4 중앙공원
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff0033cc),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "BP4 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "중앙공원")
            ]))
          ],
        ),
        _fiveten(screenHeight),
      ],
    );
  }
}

class Azone extends StatelessWidget {
  final double screenHeight;
  const Azone({
    Key key,@required this.screenHeight
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("A zone",
            style: TextStyle(
              color: const Color(0xffce0002),
              fontWeight: FontWeight.w500,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              fontSize: 14,
            ),
            textAlign: TextAlign.right),
        SizedBox(
          height: 5,
        ),
        Row(
          children: <Widget>[
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A1 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "공과대학2관")
            ])),
            _fiveten(screenHeight),
            // A2 국제대학관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A2 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "국제대학관")
            ])),
            _fiveten(screenHeight),
            // A3 대학본부
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A3 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "대학본부")
            ])),
            _fiveten(screenHeight),
            // A4 종합연구관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A4 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "종합연구관")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            // A5 레포츠센터
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A5 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "레포츠센터")
            ])),
            _fiveten(screenHeight),
            // A6 아산관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A6 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아산관")
            ])),
            _fiveten(screenHeight),
            // A7 케미컬탱커 훈련센터
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A7 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "케미컬탱커 훈련센터")
            ])),
            _fiveten(screenHeight),
            // A8 체육관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A8 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "체육관")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            // A9 50주년기념관
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A9 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "50주년기념관")
            ])),
            _fiveten(screenHeight),
            // A10 선박평형수처리장치장비실
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "A10 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "선박평형수처리장치장비실")
            ])),
            _fiveten(screenHeight),
            // AP1 중앙로
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "AP1 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "중앙로")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            // AP2 중앙광장
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "AP2 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "중앙광장")
            ])),
            _fiveten(screenHeight),
            // AP3 스포츠존
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "AP3 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "스포츠존")
            ])),
            _fiveten(screenHeight),
            // AP4 테니스코트
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "AP4 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "테니스코트")
            ])),
            _fiveten(screenHeight),
            // AP5 남해안로
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "AP5 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "남해안로")
            ])),
          ],
        ),
        _fiveten(screenHeight),
        Row(
          children: <Widget>[
            // AP6 아치파랑길
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xffcf0004),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "AP6 "),
              TextSpan(
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 12.0),
                  text: "아치파랑길")
            ]))
          ],
        ),
      ],
    );
  }
}

Widget earthQuakeResistant(num, screenHeight) {
  switch (num) {
    case 1:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              // A1 공과대학2관 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xffcf0004),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "A1 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "공과대학2관")
              ])),
              _fivetwenty(screenHeight),
              // A4 종합연구관 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xffcf0004),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "A4 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "종합연구관")
              ])),
            ],
          ),
          _fivetwenty(screenHeight),
          Row(
            children: <Widget>[
              // A5 레포츠센터 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xffcf0004),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "A5 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "레포츠센터")
              ]))
            ],
          )
        ],
      );
      break;
    case 2:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              // B2 어울림관 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff0033cc),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "B2 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "어울림관")
              ])),
              _fivetwenty(screenHeight),
              // B3 도서관 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff0033cc),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "B3 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "도서관")
              ])),
            ],
          ),
        ],
      );
      break;
    case 3:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              Text("없음",
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.right),
            ],
          ),
        ],
      );
      break;
    case 4:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              // D2 보트보관실 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xffff2d86),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "D2 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "보트보관실")
              ])),
              _fivetwenty(screenHeight),
              // D3 반도체실험동 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xffff2d86),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "D3 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "반도체실험동")
              ])),
              _fivetwenty(screenHeight),
              // D6 아라관 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xffff2d86),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "D6 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "아라관")
              ])),
            ],
          ),
          _fivetwenty(screenHeight),
          Row(
            children: <Widget>[
              // D8 국제교류협력관 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xffff2d86),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "D8 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "국제교류협력관")
              ]))
            ],
          )
        ],
      );
      break;
    case 5:
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              // E4 학생군사교육단 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xffee6a00),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "E4 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "학생군사교육단")
              ]))
            ],
          ),
        ],
      );
      break;
    default:
      return Container();
  }
}

Widget earthQuakeEvacuation(num, screenHeight) {
  switch (num) {
    case 1:
      return Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              // AP3 스포츠존 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xffcf0004),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "AP3 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "스포츠존")
              ])),
            ],
          ),
        ],
      );
      break;
    case 2:
      return Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              // BP3 어울림쉼터 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff0033cc),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "BP3 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "어울림쉼터")
              ])),
              _fivetwenty(screenHeight),
              // BP4 중앙공원 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff0033cc),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "BP4 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "중앙공원")
              ])),
            ],
          ),
        ],
      );
      break;
    case 3:
      return Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              // CP1 아치잔디공원 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff581efc),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "CP1 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "아치잔디공원")
              ])),
              _fivetwenty(screenHeight),
              // CP2 아치뜰 Copy
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff581efc),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "CP2 "),
                TextSpan(
                    style: const TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "NotoSansKR",
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0),
                    text: "아치뜰")
              ])),
            ],
          ),
        ],
      );
      break;
    case 4:
      return Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              // 없음 copy
              Text("없음",
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.right)
            ],
          ),
        ],
      );
      break;
    case 5:
      return Column(
        children: <Widget>[
          SizedBox(
            height: screenHeight * (1 / 100),
          ),
          Row(
            children: <Widget>[
              Text("없음",
                  style: const TextStyle(
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16.0),
                  textAlign: TextAlign.right)
            ],
          ),
        ],
      );
      break;
    default:
      return Container();
  }
}

Widget _fiveten(screenHeight) {
  return SizedBox(
    height: screenHeight * (0.3 / 100),
    width: 10,
  );
}

Widget _fivetwenty(screenHeight) {
  return SizedBox(
    height: screenHeight * (0.3 / 100),
    width: 20,
  );
}
