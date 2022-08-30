import 'package:flutter/material.dart';

abstract class MyTextStyles {}

class HomePageStyles extends MyTextStyles {
  HomePageStyles._init();
  static final HomePageStyles _instance = HomePageStyles._init();
  static HomePageStyles get instance => _instance;

  TextStyle homePageHeader = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w700,
    color: Colors.green.shade300,
  );

  TextStyle countTasks = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  TextStyle categoryName = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
}

class OpenCategoryPageStyles extends MyTextStyles {
  OpenCategoryPageStyles._init();
  static final OpenCategoryPageStyles _instance =
      OpenCategoryPageStyles._init();
  static OpenCategoryPageStyles get instance => _instance;

  TextStyle categoryTitle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  TextStyle taskTitle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
}

class AddTaskPageStyles extends MyTextStyles {
  AddTaskPageStyles._init();
  static final AddTaskPageStyles _instance = AddTaskPageStyles._init();
  static AddTaskPageStyles get instance => _instance;

  TextStyle categoryName = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
}
