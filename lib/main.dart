import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/myapp_widget.dart';
import 'package:todoapp/service/manage_tasks_service.dart';
import 'package:todoapp/view/add_task_page.dart';
import 'package:todoapp/view/home_page.dart';
import 'package:todoapp/view/open_category_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ManageTasksService.initialize();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const MyApp(),
    ),
  );
}

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        // HomePage
        ChildRoute(
          "/",
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          "/opencategory",
          child: (context, args) => OpenCategoryPage(categoryData: args.data),
        ),
        ChildRoute(
          "/addtask",
          child: (context, args) => const AddTaskPage(
            
          ),
        ),
      ];
}
