import 'package:flutter/material.dart';

class ListPointsWidget extends StatelessWidget {
  final String title;
  const ListPointsWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05,),
          Text(title,style: TextStyle(
              fontFamily: 'Avenir',
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold)),
        ],
      );
  }
}
