import 'package:flutter/material.dart';

class AppCustomElevatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color? bgColor;
  final Color textColor;
  final Color? borderColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Gradient? gradient;
  const AppCustomElevatedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.bgColor,
      required this.fontSize,
      this.textColor = Colors.white,
      this.borderColor,
      this.fontWeight = FontWeight.w400,
      this.gradient})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: borderColor ?? Colors.transparent, width: 1)),
          backgroundColor:
              MaterialStateProperty.all(bgColor ?? Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          elevation: MaterialStateProperty.all(0),
        ),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Text(text,
                style: TextStyle(
                    fontSize: fontSize,
                    color: textColor,
                    fontWeight: fontWeight,
                    overflow: TextOverflow.ellipsis))),
      ),
    );
  }
}
