import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";

class MenuListInfo extends StatelessWidget {
  final List<dynamic> menuTable;

  const MenuListInfo({
    Key key,
    @required this.menuTable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = menuTable;
    ListView myList = new ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        primary: false,
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    list[index]["menu"],
                    style: TextStyle(
                      color: const Color(0xff131415),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    list[index]["price"] == "" ? "￦ 0" : list[index]["price"],
                    style: TextStyle(
                      color: const Color(0xff131415),
                      fontWeight: FontWeight.w300,
                      fontFamily: "NotoSansKR",
                      fontStyle: FontStyle.normal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          );
        });
    return myList;
  }
}
