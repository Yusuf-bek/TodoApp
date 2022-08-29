import 'package:todoapp/collection/mytask.dart';
import 'package:todoapp/service/initialize_task_service.dart';

class TaskAddService {
  static Future<void> removeTask() async {
    await InitializeTaskService.isar.writeTxn(() {
      return InitializeTaskService.isar.myTasks.delete(2);
    });
  }

  static Future<void> addTask({
    required String title,
    required int indexCategory,
  }) async {
    final myTask = MyTask()
      ..title = title
      ..isDone = false
      ..categoryIndex = indexCategory;

    InitializeTaskService.isar.writeTxn(
      () async =>
          myTask.id = await InitializeTaskService.isar.myTasks.put(myTask),
    );
  }
}
