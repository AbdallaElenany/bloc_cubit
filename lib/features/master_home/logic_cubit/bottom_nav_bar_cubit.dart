import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<int> {
  BottomNavBarCubit() : super(3); // Default index (Home)

  void changeTab(int index) {
    emit(index);
  }
}
