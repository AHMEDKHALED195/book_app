import 'package:book_app/core/utlis/style.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/presentation/views/widgets/book_rating.dart';
import 'package:book_app/features/Home/presentation/views/widgets/books_action.dart';
import 'package:book_app/features/Home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:book_app/features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:book_app/features/Home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailViewBody extends StatelessWidget {
  const BookDetailViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomBookDetailsAppBar(),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.16),
                  child: SizedBox(
                    height: 400,
                    width: 300,
                    child: CustomBookImage(
                      imageUrl:
                          bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                    ),
                  ),
                ),
                const SizedBox(height: 43),
                Text(
                  bookModel.volumeInfo.title ?? '',
                  style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Opacity(
                  opacity: .7,
                  child: Text(
                    bookModel.volumeInfo.authors?[0] ?? 'Ahmed khalid',
                    style: Styles.textStyle18.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Rating(
                  rating: bookModel.volumeInfo.averageRating ?? 0,
                  count: bookModel.volumeInfo.ratingsCount ?? 0,
                ),
                const SizedBox(height: 40),
                BooksAction(bookModel: bookModel),
                Expanded(child: SizedBox(height: 50)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: SimilarBooksListView(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
