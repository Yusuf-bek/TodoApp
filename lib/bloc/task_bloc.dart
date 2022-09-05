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
        await Future.delayed(const Duration(milliseconds: 500)).then(
          (value) => emit(TaskLoaded(tasks: tasks)),
        );
      },
    );

    on<TaskEmitToInitial>(
      (event, emit) {
        emit(TaskInitial());
      },
    );

    on<AddTask>(
      (event, emit) async {
        await TaskService.addTask(myTask: event.task).then((value) async {
          List<MyTask> tasks = await TaskService.getAllData();
          emit(TaskAdded(tasks: tasks));
         
        });
      },
    );

    on<ChooseCategory>(
      (event, emit) {
        emit(TaskChoosed(event.index));
      },
    );

    on<RemoveTask>(
      (event, emit) {},
    );
  }
}
