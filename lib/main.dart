import 'package:book_app/constant.dart';
import 'package:book_app/core/utlis/service_locator.dart';
import 'package:book_app/features/Home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/Home/presentation/maneger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/Home/presentation/maneger/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_app/features/Splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setup();
  runApp(const Book());
}

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(getit.get<HomeRepoIPmpl>())
                ..fetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(getit.get<HomeRepoIPmpl>())..fetchNewestBooks(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        home: const SplashView(),
      ),
    );
  }
}
