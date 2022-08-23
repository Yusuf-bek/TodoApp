import 'package:flutter/material.dart';

class MyCircleWidget extends StatelessWidget {
  const MyCircleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.green,
      radius: 13,
      child: CircleAvatar(
        radius: 9,
        backgroundColor: Colors.white,
      ),
    );
  }
}