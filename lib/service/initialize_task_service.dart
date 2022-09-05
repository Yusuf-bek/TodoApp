import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todoapp/collection/mytask.dart';


/// To open and Initialize isar at first
/// * inctance - dependency injection used
/// * initialize() - opens Isar with MyTaskSchema
class InitializeTaskService {
  late Directory direc;
  static late Isar isar;

  InitializeTaskService._init() {
    initialize();
  }
  static final InitializeTaskService _instance = InitializeTaskService._init();
  static InitializeTaskService get instance => _instance;

/// [initialize()] - opens Isar
/// * MyTaskSchema - schema
  Future initialize() async {
    direc = await getApplicationSupportDirectory();
    isar = await Isar.open(
      [MyTaskSchema],
      directory: direc.path,
      inspector: false,
    );
  }
}
