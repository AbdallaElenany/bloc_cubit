import 'package:bloc_cubit/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/share_widgets/custom_error_widget.dart';
import '../../logic_cubit/book_details/book_details_cubit.dart';
import '../../logic_cubit/book_details/book_details_state.dart';
import 'custom_book_image.dart';

class SimilarBooksListView extends StatefulWidget {
  const SimilarBooksListView({super.key});

  @override
  State<SimilarBooksListView> createState() => _SimilarBooksListViewState();
}

class _SimilarBooksListViewState extends State<SimilarBooksListView> {
  @override
  void initState() {
    context.read<BookDetailsCubit>().emitSimilarBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .15;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'You Can also like',
          ),
        ),
        const SizedBox(height: 20),
        BlocBuilder<BookDetailsCubit, BookDetailsState>(
          buildWhen: (previous, current) =>
              current is Loading || current is Success || current is Error,
          builder: (context, state) {
            return state.maybeWhen(loading: () {
              return CircularProgressIndicator(
                color: Colors.cyan,
              );
            }, success: (booksList) {
              return SizedBox(
                height: height,
                child: ListView.builder(
                  itemCount: booksList?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: GestureDetector(
                      onTap: () => context.pushNamed(
                        Routes.bookDetailsScreen,
                        arguments: booksList?[index],
                      ),
                      child: CustomBookImage(
                        imageUrl: booksList?[index]
                                ?.volumeInfo
                                .imageLinks
                                ?.thumbnail ??
                            '',
                      ),
                    ),
                  ),
                ),
              );
            }, error: (error) {
              return CustomErrorWidget(errMessage: error);
            }, orElse: () {
              return const SizedBox.shrink();
            });
          },
        ),
      ],
    );
  }
}
