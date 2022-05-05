import 'package:flutter/material.dart';

class AppCustomElevatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color bgColor;
  final Color textColor;
  final Color borderColor;
  final double fontSize;
  final FontWeight fontWeight;
  const AppCustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.bgColor,
    required this.fontSize,
    this.textColor = Colors.white,
    required this.borderColor ,
    this.fontWeight = FontWeight.w400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
            BorderSide(color: borderColor, width: 1)),
        backgroundColor: MaterialStateProperty.all(bgColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        elevation: MaterialStateProperty.all(0),
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 13),
          child: Text(text,
              style: TextStyle(
                  fontSize: fontSize ,
                  color: textColor,
                  fontWeight: fontWeight,
                  overflow: TextOverflow.ellipsis))),
    );
  }
}
