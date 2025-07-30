import 'package:book_app/core/utlis/style.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errmessage});
  final String errmessage;
  @override
  Widget build(BuildContext context) {
    return Text(errmessage, style: Styles.textStyle18);
  }
}
