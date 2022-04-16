import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:live_easy_assignment/app/core/values/colors.dart';

import 'package:live_easy_assignment/screens/select_language.dart';

void main() async {
  await GetStorage.init();
  // return our storage service instance
  // await Get.putAsync(() => StorageService().init());
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
                  appBarTheme: const AppBarTheme(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      iconTheme: IconThemeData(color: Colors.black)),
                  scaffoldBackgroundColor: AppColors.white,
                  backgroundColor: AppColors.white),
              // translations: LocaleString(),
              // locale: Locale('en','US'),
              debugShowCheckedModeBanner: false,
              home: SelectLanguage(),
            ),
        designSize: const Size(360, 640));
  }
}
