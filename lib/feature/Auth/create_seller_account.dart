import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/core/util/sized_boxes.dart';
import 'package:demoapp/core/widgets/button_widget.dart';
import 'package:demoapp/feature/Auth/components/create_account_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateSellerAccountScreen extends StatefulWidget {
  CreateSellerAccountScreen({super.key});

  @override
  State<CreateSellerAccountScreen> createState() =>
      _CreateSellerAccountScreenState();
}

class _CreateSellerAccountScreenState extends State<CreateSellerAccountScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController businessSectorController =
      TextEditingController();
  final TextEditingController panController = TextEditingController();
  final TextEditingController gstinController = TextEditingController();
  bool _checBox = false;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    mobileController.dispose();
    businessSectorController.dispose();
    panController.dispose();
    gstinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: Adaptive.h(5)),
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
                      'Login',
                      style: GoogleFonts.poppins(
                          fontSize: 14.px, color: buttonColor),
                    ),
                  ],
                ),
                sizedBoxHeight40,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Create an account as seller',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, fontSize: 30.px),
                  ),
                ),
                sizedBoxHeight50,
                CreateAccountWidget(
                    controller: nameController,
                    label: 'Name',
                    hintText: 'Name'),
                sizedBoxHeight30,
                CreateAccountWidget(
                    controller: mobileController,
                    label: 'Mobile Number',
                    hintText: 'Mobile Number *'),
                sizedBoxHeight30,
                CreateAccountWidget(
                    controller: emailController,
                    label: 'Email',
                    hintText: 'Email *'),
                sizedBoxHeight30,
                CreateAccountWidget(
                    controller: passwordController,
                    label: 'Password',
                    hintText: 'Password *'),
                sizedBoxHeight30,
                CreateAccountWidget(
                    controller: businessSectorController,
                    label: 'Business Sector',
                    hintText: 'Business Sector *'),
                sizedBoxHeight30,
                CreateAccountWidget(
                    controller: panController, label: 'PAN', hintText: 'PAN *'),
                sizedBoxHeight30,
                CreateAccountWidget(
                    controller: gstinController,
                    label: 'GSTIN',
                    hintText: 'GSTIN *'),
                sizedBoxHeight30,
                Text(
                  'We will send you an SMS to verify your email & mobile number',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300, fontSize: 10.3.px),
                ),
                sizedBoxHeight40,
                GestureDetector(
                  onTap: () {},
                  child: ButtonWidget(
                    backgroundColor: buttonColor,
                    title: 'CREATE ACCOUNT',
                    textColor: whiteColor,
                    heights: Adaptive.h(6),
                  ),
                ),
                sizedBoxHeight20,
                Row(
                  children: [
                    Checkbox(
                      value: _checBox,
                      onChanged: (bool? value) {
                        setState(() {
                          _checBox = value ?? false;
                        });
                      },
                    ),
                    InkWell(
                      onTap: () {},
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: 'By continuing, I agree of the',
                            style: GoogleFonts.roboto(
                                color: const Color(0XFF505050)),
                          ),
                          TextSpan(
                            text: ' Terms',
                            style: GoogleFonts.roboto(
                                color: buttonColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.px),
                          ),
                          TextSpan(
                            text: ' & ',
                            style: GoogleFonts.roboto(
                                color: const Color(0XFF505050)),
                          ),
                          TextSpan(
                            text: 'Conditions.',
                            style: GoogleFonts.roboto(
                                color: buttonColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14.px),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
                sizedBoxHeight30,
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool validateInputs() {
    if (nameController.text.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter your name');
      return false;
    }
    if (mobileController.text.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter your mobile number');
      return false;
    }
    if (emailController.text.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter your email');
      return false;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar('Validation Error', 'Please enter your password');
      return false;
    }
    return true;
  }
}
