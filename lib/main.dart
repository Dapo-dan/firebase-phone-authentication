import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:live_easy_assignment/app/core/values/colors.dart';

import 'package:live_easy_assignment/screens/select_language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (_) => GetMaterialApp(
              title: 'Liveasy',
              theme: ThemeData(
                  primaryColor: AppColors.black,
                  appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      iconTheme: IconThemeData(color: Colors.black)),
                  scaffoldBackgroundColor: AppColors.white,
                  backgroundColor: AppColors.white),
              debugShowCheckedModeBanner: false,
              home: const SelectLanguage(),
            ),
        designSize: const Size(360, 640));
  }
}
