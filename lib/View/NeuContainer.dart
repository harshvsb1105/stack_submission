import 'package:flutter/material.dart';

class NeuContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final Color color;

  const NeuContainer({Key key, this.height, this.width, this.child, this.color = Colors.white24}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.transparent,
            offset: Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: color,
          border: Border.all(color: Colors.white54),
          boxShadow: [
            BoxShadow(
              color: Colors.white54,
              offset: Offset(-2, -2),
              blurRadius: 2,
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
