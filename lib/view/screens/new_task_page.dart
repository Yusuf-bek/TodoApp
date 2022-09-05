import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/bloc/task_bloc.dart';
import 'package:todoapp/collection/mytask.dart';
import 'package:todoapp/cubit/category_cubit.dart';
import 'package:todoapp/view/core/components/category_info_data.dart';
import 'package:todoapp/view/core/components/my_text_styles.dart';
import 'package:todoapp/view/core/widgets/my_circle_widget.dart';

// ignore: must_be_immutable
class AddTaskPage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: Modular.get<TaskBloc>(),
      builder: (context, state) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: const Text(
              "New Task",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              onPressed: () {
                Modular.get<TaskBloc>().add(TaskEmitToInitial());
                Modular.get<TaskBloc>().add(const LoadAllTasks());
                Modular.to.pop();
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.black,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextField(
                          controller: _controller,
                          cursorColor: Colors.grey,
                          maxLength: 30,
                          decoration: const InputDecoration(
                            hintText: "What are you planning?",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: BlocBuilder(
                    bloc: CategoryCubit(CategoryInitial()),
                    builder: (context, state) => SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (contextG, indexG) {
                          return newTaskTypeWidget(
                            choosenIndex: ModularWatchExtension(context)
                                .watch<CategoryCubit>()
                                .choosenIndex,
                            onTap: () {
                              ModularWatchExtension(context)
                                  .read<CategoryCubit>()
                                  .chooseIndex(indexG);
                            },
                            context: contextG,
                            index: indexG,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Modular.get<TaskBloc>().add(
                      AddTask(
                        MyTask()
                          ..title = _controller.text
                          ..categoryIndex =
                              state is TaskChoosed ? state.choosenIndex : 0,
                      ),
                    );
                    Modular.get<TaskBloc>().add(TaskEmitToInitial());
                    Modular.get<TaskBloc>().add(const LoadAllTasks());
                    Modular.to.pop();
                  },
                  child: const Text("Add task"),
                ),
              ],
            ),
          )),
    );
  }

  InkWell newTaskTypeWidget({
    required BuildContext context,
    required Function() onTap,
    required int index,
    required int choosenIndex,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: index == choosenIndex
              ? Colors.green.withOpacity(0.3)
              : Colors.grey.withOpacity(0.1),
        ),
        child: Row(
          children: [
            MyCircleWidget(
              circleColor: CategoryInfoData.categoryColors[
                  CategoryInfoData.categoryData[index]["colorIndex"]],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Text(
              CategoryInfoData.categoryData[index]["name"],
              style: AddTaskPageStyles.instance.categoryName,
            ),
          ],
        ),
      ),
    );
  }
}
