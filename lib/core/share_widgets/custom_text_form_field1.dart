import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextFormField1 extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData? iconData;
  final bool isNumber;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final String? suffixText;
  final bool showSuffix;
  final bool showSuffixIcon;
  const CustomTextFormField1({
    super.key,
    required this.hintText,
    required this.labelText,
    this.iconData,
    required this.myController,
    required this.isNumber,
    this.valid,
    this.obscureText,
    this.onTapIcon,
    this.suffixText,
    required this.showSuffix,
    required this.showSuffixIcon,
  });

  @override
  State<CustomTextFormField1> createState() => _CustomTextFormField1State();
}

class _CustomTextFormField1State extends State<CustomTextFormField1> {
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: TextStyle(
              color: Color(0xFF515D77),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xFFF2F2F2),
                width: 1.5,
              ),
              color: Colors.white,
            ),
            child: TextFormField(
              keyboardType: widget.isNumber
                  ? const TextInputType.numberWithOptions(decimal: true)
                  : TextInputType.emailAddress,
              validator: widget.valid,
              controller: widget.myController,
              obscureText: isShowPassword == false ? false : true,
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 12.sp, color: Color(0xFF515D77)),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                border: InputBorder.none,
                suffix: widget.showSuffix ? Text(widget.suffixText!) : null,
                suffixIcon: widget.showSuffixIcon
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            isShowPassword =
                                isShowPassword == true ? false : true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FaIcon(widget.iconData, color: Colors.black),
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
