import 'package:bloc_cubit/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/book_model.dart';
import 'book_rating.dart';
import 'custom_book_image.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key,
    required this.book,
  });
  final BookModel? book;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * .6;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: () => context.pushNamed(
          Routes.bookDetailsScreen,
          arguments: book,
        ),
        child: SizedBox(
          height: 125,
          child: Row(
            children: [
              CustomBookImage(
                  imageUrl: book?.volumeInfo.imageLinks?.thumbnail ?? ''),
              const SizedBox(width: 30),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width,
                      child: Text(
                        book!.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font16WhiteMedium,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      book!.volumeInfo.authors![0],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyles.font13DarkBlueMedium,
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Free',
                          style: TextStyles.font13DarkBlueMedium
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        BookRating(
                          count: book!.volumeInfo.ratingsCount ?? 0,
                          rating: book!.volumeInfo.averageRating ?? 0,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
