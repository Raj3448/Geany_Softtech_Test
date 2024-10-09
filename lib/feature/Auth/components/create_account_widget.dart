import 'package:demoapp/core/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateAccountWidget extends StatelessWidget {
  const CreateAccountWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: grey.withOpacity(0.3))),
        labelText: label,
        labelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500, fontSize: 14.px, color: black),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: black),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: grey.withOpacity(0.3)),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}