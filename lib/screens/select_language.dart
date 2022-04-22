import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_easy_assignment/app/core/values/colors.dart';
import 'package:live_easy_assignment/screens/enter_number.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SafeArea(
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
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 55.w),
                  child: ExpansionPanelList(
                    animationDuration: const Duration(milliseconds: 1000),
                    children: [
                      ExpansionPanel(
                        headerBuilder: (context, isExpanded) {
                          return ListTile(
                            title: Text(
                              'English',
                              style: TextStyle(
                                  fontSize: 15.sp, color: AppColors.black),
                            ),
                          );
                        },
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'English',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 15.sp, color: AppColors.black),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Hindu',
                              style: TextStyle(
                                  fontSize: 15.sp, color: AppColors.black),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              'Spanish',
                              style: TextStyle(
                                  fontSize: 15.sp, color: AppColors.black),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                          ],
                        ),
                        isExpanded: _expanded,
                        canTapOnHeader: true,
                      )
                    ],
                    expansionCallback: (panelIndex, isExpanded) {
                      _expanded = !_expanded;
                      setState(() {});
                    },
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(216.w, 40.h),
                        primary: AppColors.buttonColor),
                    onPressed: () {
                      Get.to(() => EnterNumber);
                    },
                    child: Text(
                      'NEXT',
                      style: TextStyle(fontSize: 20.0.sp, color: Colors.white),
                    )),
              ],
            )),
          ),
          Expanded(child: Container()),
          Stack(
            children: [
              Transform.scale(
                  scale: 1.27,
                  child: Image.asset('assets/images/Vector_1.png')),
              Container(
                padding: EdgeInsets.only(top: 5.h),
                child: Transform.scale(
                    scale: 1.27,
                    child: Image.asset('assets/images/Vector_2.png')),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
