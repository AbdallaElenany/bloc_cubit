import 'package:bloc_cubit/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';
import '../../logic_cubit/home_cubit.dart';
import '../../logic_cubit/home_state.dart';
import 'custom_book_image.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  @override
  void initState() {
    context.read<HomeCubit>().emitFeaturedBooksStates();
    context.read<HomeCubit>().emitNewestBooksStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .3;
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is Loading || current is SuccessF || current is Error,
      builder: (context, state) {
        return state.maybeWhen(loading: () {
          return CircularProgressIndicator(
            color: Colors.cyan,
          );
        }, successF: (bookDataList) {
          return SizedBox(
            height: height,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: bookDataList?.length,
              padding: const EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () => context.pushNamed(Routes.signUpScreen),
                  child: CustomBookImage(
                    imageUrl: bookDataList?[index]
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
          return const SizedBox.shrink();
        }, orElse: () {
          return const SizedBox.shrink();
        });
      },
    );
  }

  void setupErrorState(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font14DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font24BlackBold,
            ),
          ),
        ],
      ),
    );
  }
}
