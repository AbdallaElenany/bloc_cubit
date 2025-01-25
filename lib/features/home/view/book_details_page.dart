import 'package:bloc_cubit/features/home/view/widget/books_detail_section.dart';
import 'package:bloc_cubit/features/home/view/widget/custom_book_details_app_bar.dart';
import 'package:bloc_cubit/features/home/view/widget/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import '../data/models/book_model.dart';

class BookDetailsPage extends StatelessWidget {
  final BookModel book;
  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:20,horizontal: 20),
          child: ListView(
            children: [
              const CustomBookDetailsAppBar(),
              const SizedBox(height: 30),
              BooksDetailsSection(book: book),
              const SizedBox(height: 35),
              const SimilarBooksListView(),
            ],
          ),
        ),
      ),
    );
  }
}
