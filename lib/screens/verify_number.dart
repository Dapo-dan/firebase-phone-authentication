// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:live_easy_assignment/app/core/values/colors.dart';
import 'package:live_easy_assignment/screens/select_profile.dart';
import 'package:pinput/pinput.dart';

class VerifyNumber extends StatefulWidget {
  final String phone;
  const VerifyNumber(this.phone, {Key? key}) : super(key: key);

  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromARGB(43, 46, 66, 1),
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color.fromARGB(126, 203, 224, 1)));
  final defaultPinTheme = PinTheme(
    width: 48.w,
    height: 48.w,
    textStyle: TextStyle(
        fontSize: 20.sp, color: AppColors.black, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: AppColors.verifyBox,
      border: Border.all(color: AppColors.verifyBox),
    ),
  );

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 54.h,
              ),
              Column(children: [
                Text(
                  'Verify Phone',
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
                  "Code is sent to ${widget.phone}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0.sp, color: Colors.grey),
                )
              ]),
              Padding(
                padding: EdgeInsets.only(top: 24.h, bottom: 16.h),
                child: Pinput(
                  length: 6,
                  androidSmsAutofillMethod:
                      AndroidSmsAutofillMethod.smsRetrieverApi,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: defaultPinTheme.copyDecorationWith(
                    border: Border.all(color: AppColors.verifyBox),
                  ),
                  submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                    color: AppColors.verifyBox,
                  )),
                  onSubmitted: (pin) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _verificationCode, smsCode: pin))
                          .then((value) async {
                        if (value.user != null) {
                          Get.to(const SelectProfile());
                        }
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      _scaffoldkey.currentState!.showSnackBar(
                          const SnackBar(content: Text('invalid OTP')));
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 24.h,
                ),
                child: GestureDetector(
                  onTap: () => _verifyPhone(),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: "Didn't receive the code? ",
                          style:
                              TextStyle(fontSize: 15.0.sp, color: Colors.grey),
                          children: [
                            TextSpan(
                              text: 'Request Again',
                              style: TextStyle(
                                  fontSize: 15.0.sp, color: Colors.black),
                            )
                          ])),
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(328.w, 40.h),
                      primary: AppColors.buttonColor),
                  onPressed: () {
                    Get.to(() => const SelectProfile());
                  },
                  child: Text(
                    'Verify and continue'.toUpperCase(),
                    style: TextStyle(fontSize: 20.0.sp, color: Colors.white),
                  ))
            ],
          )),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: widget.phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Get.to(const SelectProfile());
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: const Duration(seconds: 120));
  }
}
