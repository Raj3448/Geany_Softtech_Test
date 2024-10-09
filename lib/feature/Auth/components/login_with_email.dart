// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/core/util/sized_boxes.dart';
import 'package:demoapp/core/widgets/button_widget.dart';
import 'package:demoapp/feature/Auth/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreenWithEmail extends StatelessWidget {
  LoginScreenWithEmail({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  // Email validation RegExp
  final emailRegex = RegExp(
      r"^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Email',
                  labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.px,
                      color: black),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: grey.withOpacity(0.3))),
                  hintText: 'abc@example.com',
                  hintStyle: TextStyle(
                    color: grey.withOpacity(0.3),
                  ),
                  contentPadding: const EdgeInsets.all(10)),
            ),
            SizedBox(
              height: Adaptive.h(2),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Password',
                  labelStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.px,
                      color: black),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: black,
                      ),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Password*',
                  hintStyle: TextStyle(
                    color: grey.withOpacity(0.3),
                  ),
                  contentPadding: EdgeInsets.all(10)),
            ),
            sizedBoxHeight20,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Forget Your Password?',
                        style: GoogleFonts.roboto(
                            fontSize: 16.sp, color: Colors.black)),
                    const TextSpan(
                      text: ' Reset Here',
                      style: TextStyle(
                          fontSize: 14,
                          color: chatColor,
                          fontWeight: FontWeight.w300,
                          decoration: TextDecoration.underline,
                          decorationColor: chatColor),
                    ),
                  ])),
                )
              ],
            ),
            SizedBox(
              height: Adaptive.h(8),
            ),
            InkWell(
              onTap: () {
                final email = emailController.text.trim();
                final password = passwordController.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  Get.snackbar(
                    'Error',
                    'Email and Password fields cannot be empty!',
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else if (!emailRegex.hasMatch(email)) {
                  Get.snackbar(
                    'Invalid Email',
                    'Please enter a valid email address!',
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                } else {
                  Get.to(() => OtpScreen());
                }
              },
              child: ButtonWidget(
                backgroundColor: buttonColor,
                title: 'Login',
                textColor: Colors.white,
                heights: Adaptive.h(6),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }
}
