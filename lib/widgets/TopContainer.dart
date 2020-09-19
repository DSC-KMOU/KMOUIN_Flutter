import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class TopContainer extends StatelessWidget{

  final Image child;
  const TopContainer({ Key key, @required this.child }): super(key: key);

  @override
  Widget build(BuildContext context){
    return  Container(
      width: double.infinity,
      child: child,
    );
  }
}