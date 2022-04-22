// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:live_easy_assignment/app/core/values/colors.dart';
import 'package:live_easy_assignment/screens/verify_number.dart';

class EnterNumber extends StatefulWidget {
  const EnterNumber({Key? key}) : super(key: key);

  @override
  State<EnterNumber> createState() => _EnterNumberState();
}

class _EnterNumberState extends State<EnterNumber> {
  final formKey = GlobalKey();
  String number = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close)),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 54.h,
                  ),
                  Column(children: [
                    Text(
                      'Please enter your mobile number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "You'll receive a 4 digit code \nto verify next.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15.0.sp, color: Colors.grey),
                    )
                  ]),
                  Padding(
                    padding: EdgeInsets.only(top: 32.h, bottom: 24.h),
                    child: IntlPhoneField(
                      decoration: const InputDecoration(
                          labelText: '- Mobile number',
                          border: OutlineInputBorder(borderSide: BorderSide())),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        number = phone.completeNumber;
                        setState(() {});
                      },
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(328.w, 40.h),
                          primary: AppColors.buttonColor),
                      onPressed: () {
                        Get.to(() => VerifyNumber(number));
                      },
                      child: Text(
                        'Continue'.toUpperCase(),
                        style:
                            TextStyle(fontSize: 20.0.sp, color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
