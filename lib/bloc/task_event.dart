part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadAllTasks extends TaskEvent {
  const LoadAllTasks();
}

class TaskEmitToInitial extends TaskEvent {}

class AddTask extends TaskEvent {
  final MyTask task;

  const AddTask(this.task);

  @override
  List<Object?> get props => [task];
}

class ChooseCategory extends TaskEvent {
  final int index;

  const ChooseCategory(this.index);

  @override
  List<Object?> get props => [index];
}

class RemoveTask extends TaskEvent {
  final MyTask task;

  const RemoveTask(this.task);

  @override
  List<Object?> get props => [task];
}
