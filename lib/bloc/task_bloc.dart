import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoapp/collection/mytask.dart';
import 'package:todoapp/service/task_service.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<LoadAllTasks>(
      (event, emit) async {
        List<MyTask> tasks = await TaskService.getAllData();
        await Future.delayed(
          const Duration(seconds: 1),
        ).then(
          (value) => emit(
            TaskLoaded(tasks: tasks),
          ),
        );
      },
    );

    on<AddTask>(
      (event, emit) async {
        List<MyTask> tasks = await TaskService.getAllData();
        emit(TaskAdded(tasks: tasks));
        add(LoadAllTasks(tasks));
      },
    );

    on<RemoveTask>(
      (event, emit) {},
    );
  }
}
