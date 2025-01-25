import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/share_widgets/custom_error_widget.dart';
import '../../logic_cubit/home/home_cubit.dart';
import '../../logic_cubit/home/home_state.dart';
import 'book_list_view_item.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is Loading || current is SuccessN || current is Error,
      builder: (context, state) {
        return state.maybeWhen(loading: () {
          return CircularProgressIndicator(
            color: Colors.cyan,
          );
        }, successN: (bookDataList) {
          return ListView.builder(
            itemCount: bookDataList?.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: BookListViewItem(book: bookDataList![index]),
            ),
          );
        }, error: (error) {
          return CustomErrorWidget(errMessage: error);
        }, orElse: () {
          return const SizedBox.shrink();
        });
      },
    );
  }
}
