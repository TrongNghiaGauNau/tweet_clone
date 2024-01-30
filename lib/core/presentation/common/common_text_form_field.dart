import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone_2/core/presentation/mixin.dart';
import 'package:twitter_clone_2/theme/pallete.dart';

class ConmmonTextFormField extends ConsumerWidget with DismissKeyboard {
  const ConmmonTextFormField({
    super.key,
    required this.hintText,
    required this.icon,
    this.textEditingController,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.maxLines = 1,
    this.enabled = true,
  });

  final String hintText;
  final Icon icon;
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final int maxLines;
  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        errorMaxLines: 3,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        suffixIcon: icon,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.whiteColor)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.blueColor)),
        disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Pallete.greyColor)),
      ),
      controller: textEditingController,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      maxLines: maxLines,
      onTapOutside: (event) => dismiss(),
      enabled: enabled,
    );
  }
}
