import 'package:flutter/material.dart';

class CustomTextbox extends StatelessWidget{
  const CustomTextbox({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.width,
    this.height,
    this.textStyle,
  });

  final String text;
  final double fontSize;
  final double? width;
  final double? height;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color.fromARGB(240, 217, 217, 217),
        border: Border.all(
          width: 1.5, 
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade700,
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset(4, 4)
          )
        ]
      ),
      child: Center(
        child: Text(
          text,
          softWrap: true,
          textAlign: TextAlign.center,
          style: textStyle
        ),
      ),
    );
  }
}