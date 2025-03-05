import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5.0,
      elevation: 0,
      shadowColor: Colors.cyan,
      color: Colors.transparent,
      surfaceTintColor: Colors.black,
      child: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) => onTap(index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 25,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_shipping_outlined,
              size: 25,
            ),
            label: 'Packages',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 25,
            ),
            label: 'Home',
          ),
        ],
      ),
      /* Container(
        //height: 60,
        color: Colors.grey,
        child: Row(
          children: [
            navItem(
              Icons.home_outlined,
              pageIndex == 0,
              "Home",
              onTap: () => onTap(0),
            ),
            navItem(
              Icons.message_outlined,
              pageIndex == 1,
              "Home",
              onTap: () => onTap(1),
            ),
            const SizedBox(width: 80),
            navItem(
              Icons.notifications_none_outlined,
              pageIndex == 2,
              "Home",
              onTap: () => onTap(2),
            ),
            navItem(
              Icons.person_outline,
              pageIndex == 3,
              "Home",
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),*/
    );
  }

  Widget navItem(IconData icon, bool selected, String text,
      {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          color: Colors.cyan,
          //padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: selected ? Colors.green : Colors.green.withOpacity(0.4),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
