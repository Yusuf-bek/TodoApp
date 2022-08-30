import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/view/core/components/category_info_data.dart';
import 'package:todoapp/view/core/components/my_text_styles.dart';
import 'package:todoapp/view/core/widgets/category_task_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: myScaffold(context),
    );
  }
}

Scaffold myScaffold(BuildContext context) {
  return Scaffold(
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.07,
              bottom: MediaQuery.of(context).size.height * 0.07,
            ),
            child: Text(
              "To Do List",
              style: HomePageStyles.instance.homePageHeader,
            ),
          ),
          Expanded(
            child: SizedBox(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 150,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CategoryTaskWidget(
                    categoryColor: CategoryInfoData.categoryColors[
                        CategoryInfoData.categoryData[index]["colorIndex"]],
                    categoryName: CategoryInfoData.categoryData[index]["name"],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(
        Icons.add,
        size: 35,
      ),
      onPressed: () {
        Modular.to.pushNamed(
          "/addtask",
        );
      },
    ),
  );
}
