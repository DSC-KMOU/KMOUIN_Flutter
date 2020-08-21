import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/FacilityLibButton.dart';

class LibButton extends StatelessWidget {
  LibButton ({
    @required this.num,
    @required this.stdRoomNum,
    @required this.screenWidth,
    @required this.screenHeight,
  });
  final int num;
  final int stdRoomNum;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * (42.7/100),
      height: screenHeight * (13.54/100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(20)
        ),
        border: Border.all(
            color: const Color(0xff5d9023),
            width: 1),
        boxShadow: [BoxShadow(
            color: const
            Color(0x80cacaca),
            offset:
            Offset(0,-1),
            blurRadius: 16,
            spreadRadius: 2)],
        color: const Color(0xffffffff),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "열람실 "+num.toString(),
                  style: const TextStyle(
                      color:  const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                      fontFamily: "NotoSansKR",
                      fontStyle:  FontStyle.normal,
                      fontSize: 22.0
                  )
              ),
              SizedBox(
                width: screenWidth * (1.1/100),
              ),
              Container(
                height: screenHeight * (6.52/100),
                width: screenWidth * (10.6/100),
                child: Image.asset('images/FacilityPage/book.png'),
              )
            ],
          ),
          RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                        style: const TextStyle(
                            color:  const Color(0xff5d9023),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 16.0
                        ),
                        text: stdRoomNum.toString()),
                    TextSpan(
                        style: const TextStyle(
                            color:  const Color(0xff5f605f),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 16.0
                        ),
                        text: "/150석"),
                    TextSpan(
                        style: const TextStyle(
                            color:  const Color(0xff5d9023),
                            fontWeight: FontWeight.w500,
                            fontFamily: "NotoSansKR",
                            fontStyle:  FontStyle.normal,
                            fontSize: 14.0
                        ),
                        text: " (" + ((stdRoomNum/150)*100).toInt().toString() + "%)")
                  ]
              )
          )
        ],
      ),
    );
  }
}