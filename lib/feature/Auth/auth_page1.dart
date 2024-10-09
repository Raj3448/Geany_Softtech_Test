import 'dart:developer';

import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/core/util/sized_boxes.dart';
import 'package:demoapp/feature/Auth/components/page1.dart';
import 'package:demoapp/feature/Auth/components/page2.dart';
import 'package:demoapp/feature/Auth/components/page3.dart';
import 'package:demoapp/feature/Auth/create_buyer_account_screen.dart';
import 'package:demoapp/feature/Auth/create_seller_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'login_screen.dart';

// ignore: must_be_immutable
class AuthPage1 extends StatelessWidget {
  AuthPage1({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    RxInt onpageChanged = 0.obs;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.w(4)),
          child: Column(
            children: [
              SizedBox(
                  height: Adaptive.h(60),
                  child: PageView(
                    controller: pageController,
                    onPageChanged: (value) {
                      log("value:$value");
                      onpageChanged.value = value;
                    },
                    children: const [Page1(), Page2(), Page3()],
                  )),
              sizedBoxHeight20,
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    onpageChanged.value == 0
                        ? Container(
                            width: Adaptive.w(8),
                            height: Adaptive.h(1),
                            decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius:
                                    BorderRadius.circular(Adaptive.w(5))),
                          )
                        : CircleAvatar(
                            radius: Adaptive.w(1),
                            backgroundColor: grey,
                          ),
                    sizedBoxWidth15,
                    onpageChanged.value == 1
                        ? Container(
                            width: Adaptive.w(8),
                            height: Adaptive.h(1),
                            decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius:
                                    BorderRadius.circular(Adaptive.w(5))),
                          )
                        : CircleAvatar(
                            radius: Adaptive.w(1),
                            backgroundColor: grey,
                          ),
                    sizedBoxWidth10,
                    onpageChanged.value == 2
                        ? Container(
                            width: Adaptive.w(8),
                            height: Adaptive.h(1),
                            decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius:
                                    BorderRadius.circular(Adaptive.w(5))),
                          )
                        : CircleAvatar(
                            radius: Adaptive.w(1),
                            backgroundColor: grey,
                          ),
                  ],
                );
              }),
              sizedBoxHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to ',
                    style: GoogleFonts.poppins(
                        fontSize: 26.px, fontWeight: FontWeight.w600),
                  ),
                  Image.asset(
                    'assets/images/Sellorbuy.png',
                    width: 150,
                  )
                ],
              ),
              sizedBoxHeight15,
              Text(
                'Trusted by 4 lakh+ buyers all over India as their best sourcing partner',
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 12.px),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Get.to(() => LoginScreen());
                },
                child: Expanded(
                  child: Container(
                    //width: Adaptive.w(45),
                    height: Adaptive.h(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: buttonColor),
                    child: Center(
                      child: Center(
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.px,
                              color: whiteColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              sizedBoxHeight10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> CreateSellerAccountScreen());
                    },
                    child: Container(
                      width: Adaptive.w(45),
                      height: Adaptive.h(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: buttonColor),
                      child: Center(
                        child: Center(
                          child: Text(
                            'Register as seller',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.px,
                                color: whiteColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> CreateBuyerAccountScreen());
                    },
                    child: Container(
                      width: Adaptive.w(45),
                      height: Adaptive.h(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: buttonColor),
                      child: Center(
                        child: Center(
                          child: Text(
                            'Register as buyer',
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.px,
                                color: whiteColor),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              sizedBoxHeight20
            ],
          ),
        ),
      ),
    );
  }
}
