import 'package:book_app/features/Home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CustomBookImage(
              imageUrl:
                  'https://ichef.bbci.co.uk/ace/standard/800/cpsprodpb/3b56/live/e1c18ae0-438e-11f0-9949-0316ffad8e61.jpg.webp',
            ),
          );
        },
      ),
    );
  }
}
