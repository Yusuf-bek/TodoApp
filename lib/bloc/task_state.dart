part of 'task_bloc.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];

}

class TaskInitial extends TaskState {}

class TaskLoaded extends TaskState {
  final List<MyTask> tasks;

  const TaskLoaded({required this.tasks});

  @override
  List<Object?> get props => [];
}

class TaskAdded extends TaskState {
  final List<MyTask> tasks;

  const TaskAdded({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

class TaskChoosed extends TaskState {
  final int choosenIndex;

  const TaskChoosed(this.choosenIndex);

  @override
  List<Object?> get props => [choosenIndex];
}

class TaskRemoved extends TaskState {
  final List<MyTask> tasks;

  const TaskRemoved({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}
