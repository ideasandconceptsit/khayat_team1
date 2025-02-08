import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){},
              icon: IconButton(
                onPressed: () {
                  // Switch between English and Arabic
                  print('pressed button');
                  var newLocale = Get.locale?.languageCode == 'en' ? const Locale('ar') : const Locale('en');
                  Get.updateLocale(newLocale);  // Change language
                  print('out the function');
                },
                icon: const Icon(
                  Icons.language_rounded,
                ),
              )),
        ],
        centerTitle: true,
        title:Text(
          'login'.tr,
        ),
      ),
    );
  }
}
