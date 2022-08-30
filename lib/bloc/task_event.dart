part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllTasks extends TaskEvent {
  final List<MyTask> tasks;

  const LoadAllTasks(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

class AddTask extends TaskEvent {
  final MyTask task;

  AddTask({required this.task}) {
    TaskService.addTask(myTask: task);
  }

  @override
  List<Object?> get props => [task];
}

class RemoveTask extends TaskEvent {
  final MyTask task;

  const RemoveTask(this.task);

  @override
  List<Object?> get props => [task];
}
