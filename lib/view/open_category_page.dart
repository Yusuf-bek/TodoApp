import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/core/components/my_text_styles.dart';
import 'package:todoapp/core/widgets/task_widget.dart';
import 'package:todoapp/service/get_data.dart';

// ignore: must_be_immutable
class OpenCategoryPage extends StatelessWidget {
  List categoryData;
  OpenCategoryPage({
    Key? key,
    required this.categoryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GetAllTasks().data(),
      builder: (context, snapshot) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width * 0.04,
              left: MediaQuery.of(context).size.width * 0.07,
              right: MediaQuery.of(context).size.width * 0.07,
            ),
            child: Column(
              children: [
                topPartButtonAndName(context),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: snapshot.data == null ? 0 : (snapshot.data as List).length,
                      itemBuilder: (context, index) {
                        return const TaskWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Modular.to.pushNamed(
                "/addtask",
              );
            },
            child: const Icon(
              Icons.add,
              size: 26,
            ),
          ),
        ),
      ),
    );
  }

  Expanded topPartButtonAndName(BuildContext context) {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                Container(
                  height: 35,
                  width: 6,
                  decoration: BoxDecoration(
                    color: categoryData[0],
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  categoryData[1],
                  style: OpenCategoryPageStyles.instance.categoryTitle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
