import 'package:bloc_cubit/core/helpers/extensions.dart';
import 'package:bloc_cubit/features/home/data/models/book_model.dart';
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * .3;
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: Colors.cyan,
                ),
              ),
            );
          },
          success: ( homeResponse) {
            return SizedBox(
              height: height,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeResponse.length,
                padding: const EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: GestureDetector(
                    onTap: () => context.pushNamed(Routes.signUpScreen),
                    child: CustomBookImage(
                      imageUrl: homeResponse[index]
                              .volumeInfo
                              .imageLinks
                              ?.thumbnail ??
                          '',
                    ),
                  ),
                ),
              ),
            );
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
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
              style: TextStyles.font16WhiteMedium,
            ),
          ),
        ],
      ),
    );
  }
}
