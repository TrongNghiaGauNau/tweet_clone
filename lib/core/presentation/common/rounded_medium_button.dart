import 'package:flutter/material.dart';

class RoundedMediaButton extends StatelessWidget {
  const RoundedMediaButton(
      {super.key,
      required this.onTap,
      required this.label,
      this.backgroundColor,
      this.textColor});
  final VoidCallback onTap;
  final String label;
  final Color? backgroundColor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 10),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: Text(
            label,
            style: TextStyle(color: textColor ?? Colors.black, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
