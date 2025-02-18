import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

import '../../../core/translations/language_controller.dart';
import '../../authintication/view/login_pages/login_page.dart';
import '../../authintication/view/signup_pages/signup_page.dart';
import '../../todo/todo_controller/todo_controller.dart';
import '../../todo/view/todo_page.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
  final TodoController todoController = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.find();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: IconButton(
                onPressed: () async {
                  // Switch between English and Arabic
                  print('pressed translate button');
                  // Toggle between Arabic and English
                  String newLang =
                      Get.locale!.languageCode == 'ar' ? 'en' : 'ar';
                  languageController.changeLanguage(newLang);
                  print('out the translate function');
                },
                icon: const Icon(
                  Icons.language_rounded,
                ),
              )),
        ],
        centerTitle: true,
        title: Text(
          'welcome'.tr,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'welcome'.tr,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
              child: Text(
                'Hello our trainers'.tr,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(LoginPage());
              },
              child: Text('login'.tr),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(SignupPage());
              },
              child: Text('signup'.tr),
            ),
            ElevatedButton(
              onPressed: ()async {
             //  todoController.getTodoList();
                Get.to(TodoPage());
              },
              child: Text('Todo_page'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
