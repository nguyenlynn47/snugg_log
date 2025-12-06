import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.imgString,
    this.text,
    this.width,
    this.height,
    this.imgScale,
    this.isSelected = false,
    });

  final String? text;
  final Function()? onPressed;
  final String imgString;
  final double? imgScale;
  final double? width;
  final double? height;
  final bool? isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 254, 244, 226),
          border: Border.all(
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignOutside
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
          child: Column(
            children: [
              Image.asset(
                imgString,
                scale: 1.1,
                fit: BoxFit.cover
              ),
              if (text != null) 
                Text(
                  text!,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 54, 37, 17),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
                ),
            ],
          )
        )
      ),
    );
  }
}