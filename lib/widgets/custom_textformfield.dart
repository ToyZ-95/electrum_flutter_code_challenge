import 'package:electrum_flutter_code_challenge/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    this.textEditingController,
    required this.hintText,
    this.prefixIcon,
    required this.obsecureText,
    this.validator,
    required this.enabled,
  }) : super(key: key);

  TextEditingController? textEditingController;
  String hintText;
  Icon? prefixIcon;
  bool obsecureText;
  String? Function(String?)? validator;
  bool enabled;

  OutlineInputBorder getTextFieldBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black54,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(12.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      validator: validator,
      controller: textEditingController,
      obscureText: obsecureText,
      cursorColor: primaryColor,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          focusedErrorBorder: getTextFieldBorder(),
          errorBorder: getTextFieldBorder(),
          enabledBorder: getTextFieldBorder(),
          focusedBorder: getTextFieldBorder(),
          disabledBorder: getTextFieldBorder()),
    );
  }
}
