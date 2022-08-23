import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

// ignore: must_be_immutable
class CategoryTaskWidget extends StatelessWidget {
  Color categoryIconicColor;
  CategoryTaskWidget({
    Key? key,
    required this.categoryIconicColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed("/opencategory");
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
                color: categoryIconicColor,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.calendar_today,
                  color: categoryIconicColor,
                  size: 30,
                ),
                const Text(
                  "3 tasks",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  "Work",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
