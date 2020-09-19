import "package:flutter/material.dart";

class IconContainer extends StatelessWidget {
  IconContainer({
    @required this.iconImage,
    @required this.backImage,
  });

  final Image iconImage;
  final Image backImage;

  @override
  Widget build(BuildContext context) {

    double _mainWidth = MediaQuery.of(context).size.width;
    double _iconSize = _mainWidth * (17.0/100);
    double _iconPadding = _iconSize * (18.0/100);
    double _iconPaddingTop = _iconSize * (16.5/100);


    return Container(
      margin: EdgeInsets.fromLTRB(0.0, _iconPaddingTop, 0.0, _iconPadding),
      width: _iconSize,
      height: _iconSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          backImage,
          Container(
            padding: EdgeInsets.all(_iconPadding),
            child: iconImage,
          ),
        ],
      ),
    );
  }
}