import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoapp/collection/mytask.dart';

class InitializeTaskService {
  late Directory direc;
  static late Isar isar;

  InitializeTaskService._init() {
    initialize();
  }
  static final InitializeTaskService _instance = InitializeTaskService._init();
  static InitializeTaskService get instance => _instance;

  Future initialize() async {
    direc = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [MyTaskSchema],
      directory: direc.path,
      inspector: false,
    );
  }
}
