import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_easy_assignment/app/core/values/colors.dart';
import 'package:live_easy_assignment/screens/enter_number.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SafeArea(
            child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100.0.h, bottom: 40.0.h),
                child: Icon(
                  Icons.crop_original,
                  size: 70.0.w,
                ),
              ),
              Column(children: [
                Text(
                  'Please select your Language',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'You can change the language \nat any time',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0.sp, color: Colors.grey),
                )
              ]),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h),
                child: Container(
                  width: 216.w,
                  height: 40.h,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(216.w, 40.h),
                      primary: AppColors.buttonColor),
                  onPressed: () {
                    Get.to(() => EnterNumber());
                  },
                  child: Text(
                    'NEXT',
                    style: TextStyle(fontSize: 20.0.sp, color: Colors.white),
                  ))
            ],
          ),
        )),
      ),
    );
  }
}
