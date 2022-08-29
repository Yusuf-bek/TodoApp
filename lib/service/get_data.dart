import 'package:isar/isar.dart';
import 'package:todoapp/collection/mytask.dart';
import 'package:todoapp/service/initialize_task_service.dart';

class GetAllTasks {
  
  Future data() async {
    return await InitializeTaskService.isar.myTasks.where().findAll();
  }
}
