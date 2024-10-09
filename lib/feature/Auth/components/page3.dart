
import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/core/util/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Page3 extends StatelessWidget {
  const Page3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Adaptive.h(50),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(text: TextSpan(
              children: [
                TextSpan(text: 'Fast Services, \n',
                style: GoogleFonts.poppins(fontSize: 21.px,fontWeight: FontWeight.w500,color: black)
                ),
                TextSpan(text: 'Better Experience\n',
                style: GoogleFonts.poppins(fontSize: 21.px,fontWeight: FontWeight.w500,color: buttonColor)
                ),
                TextSpan(text: 'for you',
                style: GoogleFonts.poppins(fontSize: 21.px,fontWeight: FontWeight.w500,color: black
                )
                ),
              ]
            )),
          ),
          sizedBoxHeight50,
          Image.asset('assets/images/walk3.png'),
        ],
      ),
    );
  }}