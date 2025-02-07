import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final double? textSize;
  final double? paddingLR, paddingTB;

  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.paddingLR,
    this.paddingTB,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5)
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            
            padding: EdgeInsets.only(
                top: paddingTB!,
                bottom: paddingTB!,
              left: paddingLR!,
               right: paddingLR!),
            backgroundColor: backgroundColor,
            
            shadowColor: Colors.black,
            elevation: 10,
            textStyle: TextStyle(
              fontSize: textSize ?? 18,
              // fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
        ),
      ),
    );
  }
}
