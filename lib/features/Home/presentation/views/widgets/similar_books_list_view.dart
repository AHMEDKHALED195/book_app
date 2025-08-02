import 'package:book_app/core/utlis/service_locator.dart';
import 'package:book_app/core/widgets/custom_error_widget.dart';
import 'package:book_app/features/Home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/Home/presentation/maneger/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/Home/presentation/views/book_details_view.dart';
import 'package:book_app/features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is SimilarBooksSuccess) {
            return ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
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
            );
          } else if (state is SimilarBooksFailure) {
            return CustomErrorWidget(errmessage: state.errMessage);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
