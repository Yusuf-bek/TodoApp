import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/bloc/task_bloc.dart';
import 'package:todoapp/view/core/components/my_text_styles.dart';
import 'package:todoapp/view/core/widgets/task_widget.dart';

// ignore: must_be_immutable
class OpenCategoryPage extends StatelessWidget {
  List categoryData;
  OpenCategoryPage({
    Key? key,
    required this.categoryData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TaskBloc, TaskState>(
          bloc: Modular.get<TaskBloc>(),
          builder: (context, state) {
            if (state is TaskInitial) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is TaskLoaded) {
              return pageBody(context, state.tasks);
            } else if (state is TaskAdded) {
              return pageBody(context, state.tasks);
            }

            return Center(
              child: Text(state.toString()),
            );
          },
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
    );
  }

  Padding pageBody(BuildContext context, List myList) {
    return Padding(
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
              width: double.infinity,
              height: double.infinity,
              child: ListView.builder(
                itemCount: myList.length,
                itemBuilder: (context, index) {
                  return TaskWidget(
                    categoryIndex: myList[index].categoryIndex,
                    title: myList[index].title,
                    index: index,
                  );
                },
              ),
            ),
          ),
        ],
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
