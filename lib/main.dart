import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/bloc/task_bloc.dart';
import 'package:todoapp/myapp_widget.dart';
import 'package:todoapp/service/initialize_task_service.dart';
import 'package:todoapp/view/screens/new_task_page.dart';
import 'package:todoapp/view/screens/home_page.dart';
import 'package:todoapp/view/screens/open_category_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitializeTaskService.instance.initialize();

  runApp(
    ModularApp(
      module: AppModule(),
      child: BlocProvider(
        create: (context) => TaskBloc()..add(const LoadAllTasks([])),
        child: const MyApp(),
      ),
    ),
  );
}

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
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
          child: (context, args) => const AddTaskPage(),
        ),
      ];
}
