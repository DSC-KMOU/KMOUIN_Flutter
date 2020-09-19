import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class DeveloperPage extends StatefulWidget {
  DeveloperPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DeveloperPage> {
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    Color _appbarFont = Color(0xffffffff);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(44.0),
          child: AppBar(
            centerTitle: false,
            titleSpacing: -6.0,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            automaticallyImplyLeading: false,
            title: Align(
              alignment: Alignment.centerLeft,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(44.0)),
                onPressed: () {
                  setState(
                    () {
                      Navigator.pop(context);
                    },
                  );
                },
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: 1.5,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        CupertinoIcons.back,
                        color: _appbarFont,
                      ),
                      Text(
                        "뒤로",
                        style: TextStyle(
                          color: _appbarFont,
                          fontWeight: FontWeight.w300,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 16.0,
                          wordSpacing: 0.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image:
                  AssetImage("images/ErrorAndDev/developerPagebackground.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: fullWidth * 0.149,
                        height: fullWidth * 0.149 * 1.18,
                        margin: EdgeInsets.only(top: 10.0, bottom: 23.0),
                        child: Image.asset(
                          "images/ErrorAndDev/developerPagelogo.png",
                        )),
                    TitleChip(width: fullWidth * 0.587, title: "UI,UX 디자인 총괄"),
                    LeaderText(major: "영어영문", name: "조성우"),
                    SizedBox(height: 45.0),
                    TitleChip(width: fullWidth * 0.587, title: "메인페이지 개발"),
                    LeaderText(major: "IT 융합", name: "김민욱"),
                    Divider(
                      indent: fullWidth * 0.41,
                      endIndent: fullWidth * 0.41,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0, top: 10.0),
                      child: Text(
                        "팀원",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    MemberText(major: "해양생명과학", name: "강은솔"),
                    MemberText(major: "전파공학", name: "강호연"),
                    MemberText(major: "국제통상", name: "윤예진"),
                    MemberText(major: "조선해양시스템", name: "전현경"),
                    SizedBox(height: 45.0),
                    TitleChip(width: fullWidth * 0.587, title: "버스페이지 개발"),
                    LeaderText(major: "전자통신", name: "한채연"),
                    Divider(
                      indent: fullWidth * 0.41,
                      endIndent: fullWidth * 0.41,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0, top: 10.0),
                      child: Text(
                        "팀원",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    MemberText(major: "기관공학", name: "강정인"),
                    MemberText(major: "데이터정보", name: "김정민"),
                    MemberText(major: "해양공학", name: "남궁재원"),
                    MemberText(major: "데이터정보", name: "최희주"),
                    SizedBox(height: 45.0),
                    TitleChip(width: fullWidth * 0.587, title: "식단페이지 개발"),
                    LeaderText(major: "IT 융합", name: "박선호"),
                    Divider(
                      indent: fullWidth * 0.41,
                      endIndent: fullWidth * 0.41,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0, top: 10.0),
                      child: Text(
                        "팀원",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    MemberText(major: "해양생명과학", name: "오희강"),
                    MemberText(major: "기계시스템", name: "온창범"),
                    MemberText(major: "해양공학", name: "이정우"),
                    SizedBox(height: 45.0),
                    TitleChip(
                      width: fullWidth * 0.587,
                      title: "시설페이지 개발",
                    ),
                    LeaderText(major: "IT 융합", name: "김호은"),
                    Divider(
                      indent: fullWidth * 0.41,
                      endIndent: fullWidth * 0.41,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0, top: 10.0),
                      child: Text(
                        "팀원",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    MemberText(major: "제어계측", name: "정수민"),
                    SizedBox(height: 45.0),
                    TitleChip(width: fullWidth * 0.587, title: "학사페이지 개발"),
                    LeaderText(
                      major: "IT 융합",
                      name: "정교준",
                    ),
                    Divider(
                      indent: fullWidth * 0.41,
                      endIndent: fullWidth * 0.41,
                      color: Colors.white,
                      thickness: 0.5,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5.0, top: 10.0),
                      child: Text(
                        "팀원",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontFamily: "NotoSansKR",
                          fontStyle: FontStyle.normal,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    MemberText(major: "해양공학", name: "손경미"),
                    MemberText(major: "조선해양시스템", name: "이유정"),
                    SizedBox(height: 45.0),
                    TitleChip(width: fullWidth * 0.587, title: "오류페이지 개발"),
                    LeaderText(major: "IT 융합", name: "김민욱"),
                    LeaderText(major: "IT 융합", name: "정교준"),
                    LeaderText(major: "전자통신", name: "한채연"),
                    SizedBox(height: 45.0),
                    TitleChip(width: fullWidth * 0.587, title: "서버 개발"),
                    LeaderText(major: "전자통신", name: "한채연"),
                    LeaderText(major: "IT 융합", name: "정교준"),
                    LeaderText(major: "IT 융합", name: "박선호"),
                    SizedBox(height: 45.0),
                    TitleChip(
                        width: fullWidth * 0.587, title: "Special thanks"),
                    SpecialText(major: "컴퓨터공학", name: "신영진"),
                    SpecialText(major: "IT 융합", name: "한상욱"),
                    SizedBox(height: 45.0),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class MemberText extends StatelessWidget {
  const MemberText({
    Key key,
    @required this.major,
    @required this.name,
  }) : super(key: key);
  final String major;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            major,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              fontSize: 12.0,
            ),
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              fontSize: 20.0,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class LeaderText extends StatelessWidget {
  const LeaderText({
    Key key,
    @required this.major,
    @required this.name,
  }) : super(key: key);
  final String major;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(
              "팀장",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontFamily: "NotoSansKR",
                fontStyle: FontStyle.normal,
                fontSize: 18.0,
              ),
            ),
          ),
          Text(
            major,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              // height: -1.0,
              fontSize: 14.0,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: "NotoSansKR",
                  fontStyle: FontStyle.normal,
                  fontSize: 26.0,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SpecialText extends StatelessWidget {
  const SpecialText({
    Key key,
    @required this.major,
    @required this.name,
  }) : super(key: key);
  final String major;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      child: Column(
        children: <Widget>[
          Text(
            major,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontFamily: "NotoSansKR",
              fontStyle: FontStyle.normal,
              fontSize: 14.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: "NotoSansKR",
                  fontStyle: FontStyle.normal,
                  fontSize: 26.0,
                  height: 1.2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TitleChip extends StatelessWidget {
  const TitleChip({
    Key key,
    @required this.width,
    @required this.title,
  }) : super(key: key);

  final double width;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45.0,
      margin: EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: const Color(0xff317dc7),
            fontWeight: FontWeight.w500,
            fontFamily: "NotoSansKR",
            fontStyle: FontStyle.normal,
            fontSize: 22.0,
          ),
        ),
      ),
    );
  }
}
