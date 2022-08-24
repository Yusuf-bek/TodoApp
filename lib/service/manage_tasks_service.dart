import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoapp/collection/mytask.dart';

class ManageTasksService {
  static late Directory direc;
  static late Isar isar;

  static Future initialize() async {
    direc = await getApplicationSupportDirectory();

    isar = await Isar.open(
      [MyTaskSchema],
      directory: direc.path,
      inspector: false,
    );
  }

  static Future<void> addTask(
    String title,
  ) async {
    await initialize();

    final myTask = MyTask()
      ..title = title
      ..isDone = false;

    await isar.writeTxn(
      () async => myTask.id = await isar.myTasks.put(myTask),
    );
  }
}
