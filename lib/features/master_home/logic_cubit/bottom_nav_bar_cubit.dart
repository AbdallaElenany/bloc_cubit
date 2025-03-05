import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(const BottomNavBarInitial());

  void changeTab(int index) {
    emit(BottomNavBarUpdated(index));
  }
}
