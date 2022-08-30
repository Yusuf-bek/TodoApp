import 'package:isar/isar.dart';
import 'package:todoapp/collection/mytask.dart';
import 'package:todoapp/service/initialize_task_service.dart';

class TaskService {
  static final Isar _isar = InitializeTaskService.isar;
  static late int count;

  TaskService() {
    getCount();
  }

  static Future<void> getCount() async {
    count = await _isar.myTasks.count();
  }

  static Future<List<MyTask>> getAllData() async {
    List<MyTask> data = await _isar.myTasks.where().findAll();
    return data;
  }

  static Future<void> addTask({required MyTask myTask}) async {
    _isar.writeTxn(
      () async => myTask.id = await _isar.myTasks.put(myTask),
    );
  }

  static Future<void> removeTask(int id) async {
    await _isar.writeTxn(() {
      return _isar.myTasks.delete(id);
    });
  }
}
