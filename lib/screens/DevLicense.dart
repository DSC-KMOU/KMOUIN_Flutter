import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kmouin/widgets/LicenseCard.dart';
import 'package:kmouin/widgets/LicenseData.dart';
import 'package:flutter_statusbar_text_color/flutter_statusbar_text_color.dart';

class DevLicense extends StatefulWidget {
  @override
  _DevLicense createState() => _DevLicense();
}

class _DevLicense extends State<DevLicense> {
  @override
  Widget build(BuildContext context) {
    double _mainWidth = MediaQuery.of(context).size.width;
    double _mainHeight = MediaQuery.of(context).size.height;
    FlutterStatusbarTextColor.setTextColor(null);

    double cardWidth = _mainWidth * 0.93;

    Color _appbarFont = Color(0xff5b9fee);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(44.0),
        child: AppBar(
          centerTitle: false,
          titleSpacing: -6.0,
          backgroundColor: Colors.white,
          elevation: 1.0,
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
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LicenseCard(licenseTitle: licenseTitle[0], licenseDescription: licenseDescription[0], licenseCardWidth: cardWidth,),
              LicenseCard(licenseTitle: licenseTitle[1], licenseDescription: licenseDescription[1], licenseCardWidth: cardWidth,),
              LicenseCard(licenseTitle: licenseTitle[2], licenseDescription: licenseDescription[2], licenseCardWidth: cardWidth,),
              LicenseCard(licenseTitle: licenseTitle[3], licenseDescription: licenseDescription[3], licenseCardWidth: cardWidth,),
              LicenseCard(licenseTitle: licenseTitle[4], licenseDescription: licenseDescription[4], licenseCardWidth: cardWidth,),
              Container(height: _mainHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
