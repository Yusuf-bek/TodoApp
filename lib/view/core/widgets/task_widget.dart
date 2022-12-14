import 'package:flutter/material.dart';
import 'package:todoapp/view/core/components/my_text_styles.dart';
import 'package:todoapp/view/core/widgets/my_circle_widget.dart';

class TaskWidget extends StatelessWidget {
  int index;
  String title;
  int categoryIndex;
  TaskWidget({
    Key? key,
    required this.index,
    required this.title,
    required this.categoryIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 13,
        left: 10,
        right: 10,
      ),
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyCircleWidget(),
          Text("$title $categoryIndex",
              style: OpenCategoryPageStyles.instance.taskTitle),
          const Icon(
            Icons.done,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
