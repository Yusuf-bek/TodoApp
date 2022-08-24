import 'package:isar/isar.dart';

part "mytask.g.dart";

@Collection()
class MyTask {
  Id id = Isar.autoIncrement;

  @Name("title")
  late String title;

  @Name("isDone")
  bool isDone = false;
}
