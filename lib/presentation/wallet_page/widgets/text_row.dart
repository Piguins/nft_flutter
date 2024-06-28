import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String text1;
  final String text2;
  TextStyle? textStyle;
  TextRow({
    Key? key,
    this.textStyle,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          maxLines: 1,
          style: textStyle ??
              TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
        ),
        Text(
          text2,
          maxLines: 1,
          style: textStyle ??
              TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
