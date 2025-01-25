import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.asset,
    required this.icon,
  });
  final String asset;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 30.w,
        left: 30.w,
        top: 10.h,
      ),
      child: Row(
        children: [
          Image.asset(asset, height: 80.h),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 25,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
