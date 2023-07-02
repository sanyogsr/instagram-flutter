import 'package:flutter/material.dart';

class FolllowButton extends StatelessWidget {
  final Function()? function;
  final String text;
  final Color textColor;
  final Color backGroundColor;
  final Color borderColor;

  const FolllowButton({
    Key? key,
    this.function,
    required this.backGroundColor,
    required this.text,
    required this.textColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8,
      ),
      child: TextButton(
          onPressed: function,
          child: Container(
            decoration: BoxDecoration(
                color: backGroundColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: borderColor)),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
            ),
            width: 250,
            height: 27,
            alignment: Alignment.center,
          )),
    );
  }
}
