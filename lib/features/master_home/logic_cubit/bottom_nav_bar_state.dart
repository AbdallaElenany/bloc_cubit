part of 'bottom_nav_bar_cubit.dart';

@immutable
sealed class BottomNavBarState {
  final int selectedIndex;
  const BottomNavBarState(this.selectedIndex);
}

final class BottomNavBarInitial extends BottomNavBarState {
  const BottomNavBarInitial() : super(0);
}

final class BottomNavBarUpdated extends BottomNavBarState {
  const BottomNavBarUpdated(super.index);
}
