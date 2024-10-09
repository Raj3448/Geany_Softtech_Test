import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/feature/Auth/components/login_with_email.dart';
import 'package:demoapp/feature/Auth/components/login_with_phone.dart';
import 'package:demoapp/feature/Auth/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  PageController pageController = PageController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final login = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: Adaptive.h(5),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Back',
                  style: GoogleFonts.poppins(
                      fontSize: 14.px, color: buttonColor),
                ),
                Text(
                  'Sign up',
                  style: GoogleFonts.poppins(
                      fontSize: 14.px, color: buttonColor),
                ),
              ],
            ),
            SizedBox(
              height: Adaptive.h(4),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login using Mobile\nNumber or Email',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600, fontSize: 30.px),
              ),
            ),
            SizedBox(
              height: Adaptive.h(2),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 6.w),
              decoration: BoxDecoration(
                color: const Color(0xffE6E6E6),
                borderRadius: BorderRadius.circular(Adaptive.w(8)),
              ),
              child: Obx(() {
                return Row(
                  children: [
                    login.selectedValue.value == 'Login'
                        ? GestureDetector(
                            onTap: () {
                              pageController.previousPage(
                                  duration:
                                      const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius:
                                  BorderRadius.circular(Adaptive.w(8)),
                              child: Container(
                                width: Adaptive.w(45),
                                height: Adaptive.h(6),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(Adaptive.w(12)),
                                  color: buttonColor,
                                ),
                                child: Center(
                                  child: Text(
                                    'Mobile Number',
                                    style: GoogleFonts.roboto(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              login.changingSelectedOption('Login');
                              pageController.previousPage(
                                  duration:
                                      const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 5.w,
                                  right: 5.w,
                                  top: 1.h,
                                  bottom: 1.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  'Mobile Number',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                    const Spacer(),
                    login.selectedValue.value == 'Email'
                        ? GestureDetector(
                            onTap: () {
                              login.changingSelectedOption('Email');
                              pageController.nextPage(
                                  duration:
                                      const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            },
                            child: Container(
                              width: Adaptive.w(45),
                              height: Adaptive.h(6),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Adaptive.w(12)),
                                color: buttonColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Email',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              login.changingSelectedOption('Email');
                              pageController.nextPage(
                                  duration:
                                      const Duration(milliseconds: 300),
                                  curve: Curves.linear);
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 12.w,
                                  right: 12.w,
                                  top: 1.h,
                                  bottom: 1.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  ' Email',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                  ],
                );
              }),
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Container(
                color: Colors.amber,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    const LoginScreenWithPhone(),
                    LoginScreenWithEmail(
                      emailController: emailController,
                      passwordController: passwordController,
                    )
                  ],
                  onPageChanged: (value) {
                    print("index:$value");
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
