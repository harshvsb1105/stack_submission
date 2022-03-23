import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  bool switchValue;
   SwitchWidget({Key key, this.switchValue = false}) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Transform.scale(
        scale: 0.9,
        child: CupertinoSwitch(
          activeColor: Colors.orangeAccent,
          trackColor: Colors.white54,
          value: widget.switchValue,
          onChanged: (value) {
            setState(() {
              widget.switchValue = value;
            });
          },
        ),
      ),
    );
  }
}
