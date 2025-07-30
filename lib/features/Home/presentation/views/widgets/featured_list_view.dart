import 'package:book_app/core/widgets/custom_error_widget.dart';
import 'package:book_app/features/Home/presentation/maneger/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks!.thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errmessage: state.errMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
