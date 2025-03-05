import 'package:bloc_cubit/features/master_home/view/widget/nav_item.dart';
import 'package:bloc_cubit/features/master_home/view/widget/tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/model/nav_model.dart';
import '../logic_cubit/bottom_nav_bar_cubit.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final homeNavKey = GlobalKey<NavigatorState>();
  final searchNavKey = GlobalKey<NavigatorState>();
  final notificationNavKey = GlobalKey<NavigatorState>();
  final profileNavKey = GlobalKey<NavigatorState>();

  late List<NavModel> items;

  @override
  void initState() {
    super.initState();
    items = [
      NavModel(page: const TabPage(tab: 1), navKey: homeNavKey),
      NavModel(page: const TabPage(tab: 2), navKey: searchNavKey),
      NavModel(page: const TabPage(tab: 3), navKey: notificationNavKey),
      NavModel(page: const TabPage(tab: 4), navKey: profileNavKey),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final selectedTab =
            context.read<BottomNavBarCubit>().state.selectedIndex;
        if (items[selectedTab].navKey.currentState?.canPop() ?? false) {
          items[selectedTab].navKey.currentState?.pop();
          return false;
        }
        return true;
      },
      child: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
        builder: (context, state) {
          int selectedTab = state.selectedIndex;

          return Scaffold(
            body: IndexedStack(
              index: selectedTab,
              children: items
                  .map((page) => Navigator(
                        key: page.navKey,
                        onGenerateInitialRoutes: (navigator, initialRoute) {
                          return [
                            MaterialPageRoute(builder: (context) => page.page)
                          ];
                        },
                      ))
                  .toList(),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 60,
              width: 60,
              child: FloatingActionButton(
                backgroundColor: Colors.green,
                elevation: 0,
                onPressed: () => debugPrint("Add Button pressed"),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
            bottomNavigationBar: NavBar(
              pageIndex: selectedTab,
              onTap: (index) {
                if (index == selectedTab) {
                  items[index]
                      .navKey
                      .currentState
                      ?.popUntil((route) => route.isFirst);
                } else {
                  context.read<BottomNavBarCubit>().changeTab(index);
                }
              },
            ),
          );
        },
      ),
    );
  }
}

/*/// Custom FAB Position (Moves FAB Downwards)
class CustomFABLocation extends FloatingActionButtonLocation {
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2;
    double fabY = scaffoldGeometry.contentBottom -
        (scaffoldGeometry.floatingActionButtonSize.height * 0.5);
    return Offset(fabX, fabY);
  }
}

/// Custom Notch for Square FAB
class CustomNotchedShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    if (guest == null) {
      return Path()..addRect(host);
    }

    double notchRadius = guest.width / 2;
    double notchMargin = 12.0;

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
}*/
