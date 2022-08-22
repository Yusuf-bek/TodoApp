import 'package:flutter/material.dart';
import 'package:todoapp/core/widgets/task_category_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: Colors.green.shade300),
                ),
              ),
              Expanded(
                child: SizedBox(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 150,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return TaskCategoryWidget(
                        categoryIconicColor: Colors.red,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        child: const Icon(
          Icons.add,
          size: 35,
        ),
        onPressed: () {},
      ),
    );
  }
}
