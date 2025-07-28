import 'package:book_app/core/utlis/assets.dart';
import 'package:book_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    MainAxisAlignment.end;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 20),
          Spacer(),
          IconButton(
            onPressed: () {
              Get.to(() => SearchView());
            },
            icon: Icon(Icons.search, size: 32),
          ),
        ],
      ),
    );
  }
}
