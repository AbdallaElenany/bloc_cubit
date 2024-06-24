import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final double radius;
  final String? hintText;
  final bool readOnly;
  final double? width;
  final double? height;
  final IconData? prefix;
  final Widget? suffix1;
  final TextInputType? type;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final Function(String?)? onChange;
  final Function(String?)? onSubmit;
  final VoidCallback? onTap;
  final VoidCallback? suffixOnPressed1;
  final VoidCallback? suffixOnPressed2;
  final VoidCallback? prefixOnPressed;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.keyboardType,
    this.obscureText,
    this.onSaved,
    this.onChange,
    this.suffixOnPressed1,
    this.suffixOnPressed2,
    this.onSubmit,
    this.onTap,
    this.validator,
    this.prefix,
    this.type,
    this.suffix1,
    this.labelText,
    this.hintText,
    this.height = 65,
    this.width = double.infinity,
    this.readOnly = false,
    this.prefixOnPressed,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            readOnly: readOnly,
            onTap: onTap,
            onSaved: onSaved,
            validator: validator,
            controller: controller,
            keyboardType: keyboardType,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              prefixIcon: prefix == null
                  ? null
                  : IconButton(
                      onPressed: prefixOnPressed,
                      icon: Icon(prefix),
                      color: Colors.white),
              suffixIcon: suffix1,
              hintText: hintText,
              labelText: labelText,
              enabledBorder: buildOutlineInputBorder(),
              border: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              disabledBorder: buildOutlineInputBorder(),
            ),
            obscureText: obscureText ?? false,
            onChanged: onChange,
            onFieldSubmitted: onSubmit,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }
}
