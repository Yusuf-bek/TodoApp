import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todoapp/view/core/components/category_info_data.dart';
import 'package:todoapp/view/core/components/my_text_styles.dart';
import 'package:todoapp/view/core/widgets/my_circle_widget.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "New Task",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(
            Icons.cancel,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextField(
                      cursorColor: Colors.grey,
                      maxLength: 30,
                      decoration: InputDecoration(
                        hintText: "What are you planning?",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (contextG, indexG) {
                    return newTaskTypeWidget(
                      context: contextG,
                      index: indexG,
                    );
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Add task"),
            ),
          ],
        ),
      ),
    );
  }

  InkWell newTaskTypeWidget({
    required BuildContext context,
    required int index,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Row(
          children: [
            MyCircleWidget(
              circleColor: CategoryInfoData.categoryColors[
                  CategoryInfoData.categoryData[index]["colorIndex"]],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.04,
            ),
            Text(
              CategoryInfoData.categoryData[index]["name"],
              style: AddTaskPageStyles.instance.categoryName,
            ),
          ],
        ),
      ),
    );
  }
}
