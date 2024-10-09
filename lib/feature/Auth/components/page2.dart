
import 'package:demoapp/core/util/colors.dart';
import 'package:demoapp/core/util/sized_boxes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Page2 extends StatelessWidget {
  const Page2({
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
                TextSpan(text: 'Quick Transaction\n',
                style: GoogleFonts.poppins(fontSize: 21.px,fontWeight: FontWeight.w500,color: black)
                ),
                TextSpan(text: 'Easy Payment\n',
                style: GoogleFonts.poppins(fontSize: 21.px,fontWeight: FontWeight.w500,color: buttonColor)
                ),
                TextSpan(text: 'with Click to Buy',
                style: GoogleFonts.poppins(fontSize: 21.px,fontWeight: FontWeight.w500,color: black
                )
                ),
              ]
            )),
          ),
          sizedBoxHeight50,
          Image.asset('assets/images/walk2.png'),
        ],
      ),
    );
  }
}