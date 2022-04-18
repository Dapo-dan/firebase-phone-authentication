import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_easy_assignment/app/core/values/colors.dart';

class SelectProfile extends StatelessWidget {
  const SelectProfile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const Icon(null)),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
                          SizedBox(
                height: 54.h,
              ),
                Text(
                  'Please select your profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0.sp,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(328.w, 40.h),
                      primary: AppColors.buttonColor),
                  onPressed: () {},
                  child: Text(
                    'Continue'.toUpperCase(),
                    style: TextStyle(fontSize: 20.0.sp, color: Colors.white),
                  ))
          ],)
      ),
    );
  }
}