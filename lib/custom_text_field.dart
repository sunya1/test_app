import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextField extends StatelessWidget {
  final Color bgColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Color hintColor;
  final TextInputType keyboardType;
  final String hintText;

  const CustomTextField({Key? key, required this.bgColor, required this.borderColor, required this.focusedBorderColor, required this.hintColor, required this.keyboardType, required this.hintText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
   
      decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(16)),
      child: TextField(
        keyboardType: keyboardType,
        cursorRadius: const Radius.circular(3),
        textAlign: TextAlign.left,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            counterText: '',
            contentPadding:
                const EdgeInsets.only(left: 12, top: 14, bottom: 14),
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:  BorderSide(color: focusedBorderColor)),
            hintStyle: TextStyle(color: hintColor),
            border: InputBorder.none),
      ),
    );
  }
}
