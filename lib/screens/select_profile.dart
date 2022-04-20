import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:live_easy_assignment/app/core/values/colors.dart';

enum SingingCharacter { shipper, transporter }

class SelectProfile extends StatefulWidget {
  const SelectProfile({Key? key}) : super(key: key);

  @override
  State<SelectProfile> createState() => _SelectProfileState();
}

class _SelectProfileState extends State<SelectProfile> {
  SingingCharacter? _character = SingingCharacter.shipper;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: null,
      child: Scaffold(
        appBar: AppBar(leading: const Icon(null)),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
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
                Padding(
                  padding: EdgeInsets.only(top: 26.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70.h,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: ListTile(
                        title: Row(
                          children: [
                            Image.asset(
                              'assets/images/shipper.png',
                              width: 40.w,
                              height: 40.w,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: RichText(
                                text: TextSpan(
                                    text: 'Shipper\n',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black),
                                    children: [
                                      TextSpan(
                                        text:
                                            'Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.darkGray),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        leading: Transform.scale(
                          scale: 2.0,
                          child: Radio<SingingCharacter>(
                            value: SingingCharacter.shipper,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.h),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 70.h,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: ListTile(
                        title: Row(
                          children: [
                            Image.asset(
                              'assets/images/truck.png',
                              width: 40.w,
                              height: 40.w,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: RichText(
                                text: TextSpan(
                                    text: 'Transporter\n',
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.black),
                                    children: [
                                      TextSpan(
                                        text:
                                            'Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: AppColors.darkGray),
                                      )
                                    ]),
                              ),
                            ),
                          ],
                        ),
                        leading: Transform.scale(
                          scale: 2.0,
                          child: Radio<SingingCharacter>(
                            value: SingingCharacter.transporter,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
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
              ],
            )),
      ),
    );
  }
}
