import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final Color bgColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color hintColor;
  final TextInputType keyboardType;
  final String hintText;
  final Color textColor;
  final bool obscureText;
  final bool isPassword;
  final Function()? onTapSuffixIcon;
  final TextEditingController textEditingController;

  const CustomTextField(
      {Key? key,
      required this.bgColor,
      required this.borderColor,
      required this.focusedBorderColor,
      required this.hintColor,
      required this.keyboardType,
      required this.hintText,
      required this.textColor,
      this.obscureText = false,
      this.isPassword = false,
      this.onTapSuffixIcon,
      required this.textEditingController})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(16)),
      child: TextField(
        controller: textEditingController,
        obscureText: obscureText,
        keyboardType: keyboardType,
        cursorRadius: const Radius.circular(3),
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 17, fontWeight: FontWeight.w400, color: textColor),
        decoration: InputDecoration(
            suffixIcon: isPassword
                ? InkWell(
                    onTap: onTapSuffixIcon,
                    child: obscureText
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.white,
                          )
                        : const Icon(Icons.visibility_off, color: Colors.white))
                : const SizedBox(),
            counterText: '',
            contentPadding:
                const EdgeInsets.only(left: 12, top: 14, bottom: 14),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: focusedBorderColor)),
            hintStyle: TextStyle(color: hintColor),
            border: InputBorder.none),
      ),
    );
  }
}
