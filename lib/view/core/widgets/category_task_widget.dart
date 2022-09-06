import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/service/task_service.dart';
import 'package:todoapp/view/core/components/my_text_styles.dart';
import 'package:todoapp/view/core/extensions/mediaquery_height_width_extension.dart';

// ignore: must_be_immutable
class CategoryTaskWidget extends StatelessWidget {
  Color categoryColor;
  String categoryName;
  CategoryTaskWidget({
    Key? key,
    required this.categoryColor,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TaskService.getCount(),
      builder: (context, snapshot) {
        return InkWell(
          onTap: () {
            Modular.to.pushNamed(
              "/opencategory",
              arguments: [
                categoryColor,
                categoryName,
              ],
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: 6,
                  decoration: BoxDecoration(
                    color: categoryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  width: context.width * 0.04,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: categoryColor,
                      size: 30,
                    ),
                    Text(snapshot.data.toString(),
                        style: HomePageStyles.instance.countTasks),
                    Text(categoryName,
                        style: HomePageStyles.instance.categoryName),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
