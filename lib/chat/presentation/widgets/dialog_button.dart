import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.btnName,
    this.onTap,
    this.color = Colors.white,
    this.textColor = Colors.black,
  });

  final String btnName;
  final void Function()? onTap;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        height: 40,
        width: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        child: Text(
          btnName,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
