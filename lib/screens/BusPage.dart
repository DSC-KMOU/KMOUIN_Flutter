import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/TopContainer.dart';
import '../widgets/BusCard.dart';
import '../widgets/BusInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(BusPage());
}

class BusPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Map<dynamic, dynamic>> _fetch1() async {
    try {
      print("future 실행!");
      http.Response response =
          await http.get('http://192.168.75.191:3000/api/bus');
      final busInfo = json.decode(response.body);
      print(busInfo);
      return busInfo;
    } catch (err) {
      return {"status": err};
    }
  }

  @override
  Widget build(BuildContext context) {
    double rate = 1 / 375.0;
    double fullWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () => Navigator.maybePop(context),
          color: Color(0xffffffff),
        ),
        titleSpacing: -15,
        title: Text(
          "메인",
          style: const TextStyle(
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w300,
            fontFamily: "NotoSansKR",
            fontStyle: FontStyle.normal,
            // fontSize: 16.0,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          TopContainer(
            child: Image.asset('images/BusPage/TopContainer.png'),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 80.0),
                Text(
                  "버스 정보",
                  style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 32.0,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 4.0),
                Text(
                  "실시간 위치를 알 수 있어요",
                  style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w300,
                    fontFamily: "NotoSansKR",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                FutureBuilder(
                    future: _fetch1(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return Column(
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        );
                      }else if (snapshot.hasError) {
                        return Column(
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            Text(
                              "Error",
                              style: const TextStyle(
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w300,
                                fontFamily: "NotoSansKR",
                                fontStyle: FontStyle.normal,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        );
                      } else {
                        return  Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data["status"],
                                      style: const TextStyle(
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w300,
                                        fontFamily: "NotoSansKR",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(height: 43.0),
                                    BusCard(
                                        title: '셔틀 버스',
                                        width: 355 * fullWidth * rate,
                                        children: <Widget>[
                                          BusInfo(
                                            width: 100 * fullWidth * rate,
                                            title: "평일",
                                            timeTable: snapshot.data["result"]["week"],
                                          ),
                                          SizedBox(height: 14.0),
                                          BusInfo(
                                            width: 100 * fullWidth * rate,
                                            title: "공휴일",
                                              timeTable: snapshot.data["result"]["saturday"],
                                          ),
                                          SizedBox(height: 14.0),
                                          BusInfo(
                                            width: 100 * fullWidth * rate,
                                            title: "시험기간",
                                              timeTable: snapshot.data["result"]["weekend"],
                                          ),
                                        ]),
                                    SizedBox(height: 30.0),
                                    BusCard(
                                        title: '190번 버스',
                                        width: 355 * fullWidth * rate,
                                        children: <Widget>[
                                          BusInfo(
                                            width: 100 * fullWidth * rate,
                                            title: "해양대",
                                            timeTable: snapshot.data["result"]["week"],
                                          ),
                                          SizedBox(height: 14.0),
                                          BusInfo(
                                            width: 100 * fullWidth * rate,
                                            title: "부산대",
                                            timeTable: snapshot.data["result"]["week"],
                                          ),
                                          SizedBox(height: 14.0),
                                          BusInfo(
                                            width: 100 * fullWidth * rate,
                                            title: "영도대교",
                                            timeTable: snapshot.data["result"]["week"],
                                          ),
                                        ]),
                                    SizedBox(height: 39.0),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => BusPage()));
                                      },
                                      child: Container(
                                        width: 355 * fullWidth * rate,
                                        height: 100,
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "통근 버스 정보",
                                              style: const TextStyle(
                                                color: const Color(0xff131415),
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "NotoSansKR",
                                                fontStyle: FontStyle.normal,
                                                fontSize: 28.0,
                                              ),
                                            ),
                                            SizedBox(width: 22 * fullWidth * rate),
                                            SizedBox(
                                              width: 62,
                                              height: 44,
                                              child: Image.asset(
                                                  "images/BusPage/commuterbus.png"),
                                            )
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                          border: Border.all(
                                              color: const Color(0xff842fb5), width: 1),
                                          boxShadow: [
                                            BoxShadow(
                                                color: const Color(0x80cacaca),
                                                offset: Offset(0, -1),
                                                blurRadius: 16,
                                                spreadRadius: 2)
                                          ],
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ]),
                        );
                      }
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
