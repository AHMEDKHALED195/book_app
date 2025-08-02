import 'package:book_app/core/utlis/service_locator.dart';
import 'package:book_app/core/widgets/custom_error_widget.dart';
import 'package:book_app/features/Home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/Home/presentation/maneger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/Home/presentation/maneger/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/Home/presentation/views/book_details_view.dart';
import 'package:book_app/features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        () => BlocProvider(
                          create: (context) =>
                              SimilarBooksCubit(getit.get<HomeRepoIPmpl>()),
                          child: BookDetailsView(bookModel: state.books[index]),
                        ),
                      );
                    },
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                          '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errmessage: state.errMessage);
        } else {
          return const Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
