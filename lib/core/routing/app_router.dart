import 'package:bloc_cubit/core/routing/routes.dart';
import 'package:bloc_cubit/features/home/logic_cubit/book_details/book_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/data/models/book_model.dart';
import '../../features/home/logic_cubit/home/home_cubit.dart';
import '../../features/home/view/book_details_page.dart';
import '../../features/home/view/home_page.dart';
import '../../features/master_home/logic_cubit/bottom_nav_bar_cubit.dart';
import '../../features/master_home/view/master_home.dart';
import '../../features/send_data_test.dart';
import '../../features/signUp.dart';
import '../di/dependency_injection.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpPage(),
        );

      case Routes.masterHome:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => BottomNavBarCubit(),
            child: BottomNavBar(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>(),
            child: const HomeScreen(),
          ),
        );

      case Routes.bookDetailsScreen:
        final book = settings.arguments as BookModel;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<BookDetailsCubit>(),
            child: BookDetailsPage(
              book: book,
            ),
          ),
        );

      case Routes.sendDataTest:
        return MaterialPageRoute(
          builder: (_) => SendDataTest(),
        );

      default:
        return null;
    }
  }
}
