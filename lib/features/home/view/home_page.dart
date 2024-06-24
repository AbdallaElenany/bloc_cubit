import 'package:bloc_cubit/features/home/view/widget/custom_app_bar.dart';
import 'package:bloc_cubit/features/home/view/widget/featured_books_list_view.dart';
import 'package:bloc_cubit/features/home/view/widget/newest_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/theming/styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomAppBar(
                    asset: "assets/images/book.PNG",
                    icon: FontAwesomeIcons.magnifyingGlass,
                  ),
                  const FeaturedBooksListView(),
                  SizedBox(height: 50.h),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w),
                    child: Text('Newest Books',
                        style: TextStyles.font13DarkBlueRegular),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            const SliverFillRemaining(
              child: NewestBooksListView(),
            )
          ],
        ),
      ),
    );
  }
}
