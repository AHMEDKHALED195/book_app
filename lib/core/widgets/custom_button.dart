import 'package:book_app/core/utlis/style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroungcolor,
    this.borderRadius,
    required this.textcolor,
    required this.text,
    this.onpressed,
  });
  // ignore: prefer_typing_uninitialized_variables
  final text;
  final Color backgroungcolor;
  final Color textcolor;
  final BorderRadius? borderRadius;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroungcolor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadiusGeometry.circular(16),
          ),
        ),
        onPressed: onpressed,
        child: Text(
          text,
          style: Styles.textStyle18.copyWith(
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
