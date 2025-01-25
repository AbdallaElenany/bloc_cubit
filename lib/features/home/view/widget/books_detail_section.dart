import 'package:flutter/material.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/book_model.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BooksDetailsSection extends StatelessWidget {
  final BookModel book;
  const BooksDetailsSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * .18;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width),
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          textAlign: TextAlign.center,
          book.volumeInfo.title ?? '',
          style: TextStyles.font24BlackBold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo.authors?[0] ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(height: 37),
        BooksAction(
          book: book,
        ),
      ],
    );
  }
}
