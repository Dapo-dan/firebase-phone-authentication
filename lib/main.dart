import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:live_easy_assignment/screens/select_language.dart';

void main() async {
  await GetStorage.init();
  // return our storage service instance
  // await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Liveasy',
      debugShowCheckedModeBanner: false,
      home: const SelectLanguage(),
    );
  }
}