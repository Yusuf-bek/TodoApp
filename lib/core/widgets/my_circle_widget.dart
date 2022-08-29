import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyCircleWidget extends StatelessWidget {
  Color? circleColor = Colors.green;
  MyCircleWidget({Key? key, this.circleColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: circleColor,
      radius: 13,
      child: const CircleAvatar(
        radius: 9,
        backgroundColor: Colors.white,
      ),
    );
  }
}
