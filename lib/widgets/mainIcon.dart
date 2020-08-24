import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  IconContainer({
    @required this.startingColor,
    @required this.endingColor,
    @required this.iconImage,
  });

  final Color startingColor;
  final Color endingColor;
  final Image iconImage;

  @override
  Widget build(BuildContext context) {

    double _mainWidth = MediaQuery.of(context).size.width;
    double _iconSize = _mainWidth * (17.0/100);
    double _iconPadding = _iconSize * (19.0/100);


    return Container(
      margin: EdgeInsets.fromLTRB(0.0, _iconPadding, 0.0, _iconPadding),
      width: _iconSize,
      height: _iconSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_iconSize),
        gradient: LinearGradient(
          begin: Alignment(
            0.20662397904829533,
            0,
          ),
          end: Alignment(
            0.8835055264559655,
            1.0000000000000002,
          ),
          colors: [
            startingColor,
            endingColor,
          ],
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(_iconPadding),
        child: iconImage,
      ),
    );
  }
}