import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../font_&_color_helper.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? obscureText, isRequiredField;
  final Widget? suffixIcon, prefixIcon;
  final String label;
  final TextInputType? keyboardType;
  final int? minLines, maxLines, maxCharacters;
  final FormFieldValidator? validator;
  final AutovalidateMode? autoValidateMode;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  const CommonTextField(
      {super.key,
      this.controller,
      this.obscureText = false,
      this.suffixIcon,
      required this.label,
      this.prefixIcon,
      this.keyboardType,
      this.minLines,
      this.maxLines,
      this.validator,
      this.isRequiredField = false,
      this.autoValidateMode,
      this.maxCharacters,
      this.textCapitalization = TextCapitalization.none,
      this.readOnly = false,
      this.onChanged,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: controller,
        autovalidateMode: autoValidateMode,
        obscureText: obscureText!,
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines,
        readOnly: readOnly!,
        textCapitalization: textCapitalization!,
        onChanged: onChanged,
        inputFormatters: maxCharacters != null
            ? [LengthLimitingTextInputFormatter(maxCharacters)]
            : null,
        onTap: onTap,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(PaddingHelper.hsPaddingM),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black.withOpacity(0.5)),
          ),
          // hintText: label,
          // label: Text(label),
          label: RichText(
              text: TextSpan(children: [
            TextSpan(text: label, style: const TextStyle(color: Colors.black)),
            if (isRequiredField!)
              const TextSpan(text: ' *', style: TextStyle(color: Colors.red))
          ])),
          labelStyle: const TextStyle(
              color: Colors.black54, fontFamily: FontHelper.montserratMedium),
          hintStyle: const TextStyle(
              color: Colors.black54, fontFamily: FontHelper.montserratMedium),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
