import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/core/util/sized_boxes.dart';
import 'package:demoapp/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../home/home_page.dart';

class OtpScreen extends StatefulWidget {
  OtpScreen({this.isReset = false, super.key});
  final bool isReset;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final focusNode = FocusNode();

  final otpController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 46,
    height: 46,
    textStyle: const TextStyle(
      fontSize: 22,
      color: Color.fromRGBO(30, 60, 87, 1),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: grey),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Adaptive.h(5),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Back',
                      style: GoogleFonts.poppins(
                          fontSize: 14.px, color: buttonColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "OTP Verification",
                      style: GoogleFonts.roboto(
                          fontSize: 30.px, fontWeight: FontWeight.w500),
                    )),
                SizedBox(
                  height: 3.h,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'A 4 digit OTP code has been sent to ',
                    style: GoogleFonts.roboto(
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  TextSpan(
                    text: '+91 9156313158} \n',
                    style: GoogleFonts.roboto(
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400,
                        color: buttonColor),
                  ),
                  TextSpan(
                    text: 'enter the code to continue. ',
                    style: GoogleFonts.roboto(
                        fontSize: 14.px,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  )
                ])),
                SizedBox(
                  height: Adaptive.h(5),
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Verification Code',
                      style: GoogleFonts.poppins(
                          fontSize: 14.px, fontWeight: FontWeight.w400),
                    )),
                sizedBoxHeight20,
                pinPutFunction(),
                SizedBox(
                  height: Adaptive.h(1),
                ),
                Row(
                  children: [
                    Text(
                      'Trying to auto-fill OTP 00:10',
                      style: GoogleFonts.poppins(
                          fontSize: 13.px,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff9E9E9E)),
                    ),
                    const Spacer(),
                    Text(
                      'Re-Send Code',
                      style: GoogleFonts.poppins(
                          fontSize: 14.px,
                          fontWeight: FontWeight.w400,
                          color: buttonColor,
                          decoration: TextDecoration.underline,
                          decorationColor: buttonColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: Adaptive.h(6),
                ),
                InkWell(
                    onTap: () {
                      String enteredOtp = otpController.text;
                      if (enteredOtp.isEmpty) {
                        Get.snackbar(
                          'Error',
                          'OTP field cannot be empty!',
                          backgroundColor: Colors.redAccent,
                          colorText: Colors.white,
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        if (widget.isReset) {
                        } else {
                          Get.to(() => const HomeScreen());
                        }
                      }
                    },
                    child: ButtonWidget(
                      backgroundColor: buttonColor,
                      title: 'Verify',
                      textColor: Colors.white,
                      heights: Adaptive.h(6),
                    )),
                SizedBox(
                  height: Adaptive.h(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Directionality pinPutFunction() {
    return Directionality(
      // Specify direction if desired
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 4,
        controller: otpController,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme.copyWith(
            decoration: BoxDecoration(
          color: const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
        )),
        separatorBuilder: (index) => SizedBox(width: 13.w),
        validator: (value) {
          return null;
        },
        hapticFeedbackType: HapticFeedbackType.lightImpact,
        onCompleted: (pin) {
          debugPrint('onCompleted: $pin');
        },
        onChanged: (value) {
          debugPrint('onChanged: $value');
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: Adaptive.w(20),
              height: 1,
              color: focusedBorderColor,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            color: fillColor,
            borderRadius: BorderRadius.circular(19),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }
}
