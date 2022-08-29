import 'package:todoapp/collection/mytask.dart';
import 'package:todoapp/service/initialize_task_service.dart';

class GetCountTasks{
  Future<int> getCount() async{
    int count = await InitializeTaskService.isar.myTasks.count();
    return count;
  }
}
