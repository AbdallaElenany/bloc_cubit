import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic_cubit/bottom_nav_bar_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) => Scaffold(
          body: pages[state], // Show selected screen
          floatingActionButton: SizedBox(
            width: 60, // Square width
            height: 60, // Square height
            child: FloatingActionButton(
              onPressed: () {
                context
                    .read<BottomNavBarCubit>()
                    .changeTab(2); // Navigate to Dashboard
              },
              backgroundColor: Colors.blue, // Adjust color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    10), // Square edges with slight rounding
              ),
              child: Icon(Icons.dashboard,
                  size: 25, color: Colors.white), // Your custom icon
            ),
          ),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            height: 75,
            shape: CustomNotchedShape(), // Custom notch for square FAB
            notchMargin: 6.0, // Space for FAB cutout
            color: Colors.transparent,
            //shadowColor: Colors.grey,
            surfaceTintColor: Colors.black,
            child: BottomNavigationBar(
              currentIndex: state,
              onTap: (index) =>
                  context.read<BottomNavBarCubit>().changeTab(index),
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              elevation: 0,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_shipping_outlined),
                  label: 'Packages',
                ),
                const BottomNavigationBarItem(icon: SizedBox(), label: ""),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom Notch for Square FAB
class CustomNotchedShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null) {
      return Path()..addRect(host);
    }

    double notchRadius = guest.width / 2.1;
    double notchMargin = 2.0;

    Path path = Path()
      ..moveTo(host.left, host.top)
      ..lineTo(guest.center.dx - notchRadius - notchMargin, host.top)
      ..arcToPoint(
        Offset(guest.center.dx + notchRadius + notchMargin, host.top),
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..lineTo(host.right, host.top)
      ..lineTo(host.right, host.bottom)
      ..lineTo(host.left, host.bottom)
      ..close();

    return path;
  }
}
