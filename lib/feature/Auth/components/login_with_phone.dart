import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/core/util/sized_boxes.dart';
import 'package:demoapp/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreenWithPhone extends StatelessWidget {
  const LoginScreenWithPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 1.h,
            ),
            TextField(
            decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: 'Mobile Number',
              labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14.px,color: black),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: black,
                ),
                borderRadius: BorderRadius.circular(10)
              ),
                focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: grey)
              ),
              hintText: '+91 | Mobile number ',
              hintStyle: TextStyle(
                color: grey.withOpacity(0.3),
              ),
              contentPadding: EdgeInsets.all(10)
            ),
            
            
            ),
                                                SizedBox(height: Adaptive.h(2),),

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBoxHeight10,
                    RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Loging Using',
                        style: GoogleFonts.roboto(fontSize: 16.sp,color: Colors.black)
                      ),
                      const TextSpan(
                        text: ' Password',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w300,
                        decoration: TextDecoration.underline,
                        decorationColor:  Colors.blue

                        
                        ),
                      ),
                    ]
                  )
                    )
          ],
        ),
        SizedBox(height: Adaptive.h(8),),
        InkWell(
          onTap: () {},
          child: ButtonWidget(backgroundColor:buttonColor , title: 'Get Otp', textColor: Colors.white,heights: Adaptive.h(6),)),
        SizedBox(height: 2.h,),
        InkWell(
          onTap: () {
            // Get.to(()=> CreateAccountScreeen());
          },
          child: RichText(text: TextSpan(
            children: [
              TextSpan(
                text: 'By continuing, I agree of the',
              style: GoogleFonts.roboto(
                color: const Color(0XFF505050),
              ),
              
              ),
              TextSpan(
                text: ' Terms of Use',
                style: GoogleFonts.roboto(
                  color: buttonColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.px
                )
              ),
              TextSpan(
                text: '&',
              style: GoogleFonts.roboto(
                color: const Color(0XFF505050),
              ),
              
              ),
              TextSpan(
                text: ' Privacy \npolicy ',
              style: GoogleFonts.roboto(
              color: buttonColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.px
              ),
              
              ),
            ]
          )),
        ),
      
          ],
        ),
      ),
    );
  }
}