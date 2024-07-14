import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketplace/util/colors.dart';

class MainInputField extends StatelessWidget {
  MainInputField({
    super.key, this.controller,
        required this.label,
        this.currentNode,
        this.hint,
        this.nextNode,
        this.isPassword = false,
        this.autoValidate = false,
        this.errorText = '',
        this.onChanged,
        this.validator,
        this.borderColor,
        this.onsaved,
        this.keyboard,
        this.initialValue,
        this.copy = false,
        this.isEnabled = true,
        this.onFieldSubmitted,
        this.textInputAction,
        this.maxLines = 1,
        this.showHint = true,
        this.isForgottenOption = false,
        this.suffixIcon,
        this.inputFormatters
  }) : assert(label != null);

  final String label;
  final String? hint;
  final FocusNode? currentNode;
  final FocusNode? nextNode;
  final String? errorText;
  final bool isPassword;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final Function(String?)? onsaved;
  final TextInputType? keyboard;
  final bool isEnabled;
  final bool copy;
  final bool autoValidate;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final dynamic onFieldSubmitted;
  final int maxLines;
  final bool showHint;
  final TextEditingController? controller;
  final bool isForgottenOption;
  final List<TextInputFormatter>? inputFormatters;
  final Color? borderColor;
  final Widget? suffixIcon;

  final ValueNotifier<bool> hasError = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          enabled: isEnabled,
          initialValue: initialValue,
          keyboardType: keyboard,
          obscureText: isPassword,
          onChanged: onChanged,
          validator: (s) {
            if(validator != null) {
              return validator!(s);
            } else {
              hasError.value = false;
              return null;
            }
          },
          focusNode: currentNode,
          inputFormatters: inputFormatters,
          onSaved: (String? value) {
            FocusScope.of(context).requestFocus(nextNode);
            onsaved!(value);
          },
          onFieldSubmitted: (String? value) {
            FocusScope.of(context).requestFocus(nextNode);
            if(onFieldSubmitted != null) {
              onFieldSubmitted(value);
            }
          },
          textInputAction: textInputAction,
          decoration: InputDecoration(
            fillColor: XColors.primaryColor().withOpacity(0.0),
            filled: true,
            hintStyle: const TextStyle(color: Colors.grey),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              borderSide: BorderSide(
                color: XColors.primaryColor().withOpacity(0.1),
                width: 1
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(11.0)),
              borderSide: BorderSide(
                  color: XColors.primaryColor().withOpacity(0.1),
                  width: 1
              ),
            ),
            errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(11.0)),
                borderSide: BorderSide(color: Colors.red)
            ),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(
                    color: Colors.red,
                    width: 2
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                borderSide: BorderSide(
                    color: XColors.primaryColor(),
                    width: 2
                )
            ),
            contentPadding: const EdgeInsets.only(bottom: 17, left: 10.0, right: 10.0, top: 17),
            labelText: label,
            labelStyle: TextStyle(color: XColors.background(), fontWeight: FontWeight.w400),
          ),
          style: TextStyle(color: XColors.background(), fontWeight: FontWeight.w400, fontSize: 16),
        ),
        if(suffixIcon != null) ... [
          Positioned(
              right: 20,
              top: 0,
              bottom: 0,
              child: suffixIcon!
          )
        ]
      ],
    );
  }
}

class PasswordValidator {
  static String? validate(String? val) {
    Pattern pattern = r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])';
    RegExp regex = RegExp(pattern as String);
    if (val!.isEmpty) {
      return "Enter a password";
    } else if (val.length < 6 || (!regex.hasMatch(val))) {
      return "Password not strong enough";
    } else {
      return null;
    }
  }
}

class EmailValidator {
  static String? validate(String? val) {
    if (!val!.contains("@") || !val.contains(".")) {
      return "Enter a valid Email address";
    } else if (val.isEmpty) {
      return "Enter your Email address";
    } else {
      return null;
    }
  }
}

class AnyInputValidator {
  static String? emptyValidate(String? val, {String? inputName}) {
    if (val!.isEmpty) {
      return "Enter your ${inputName ?? 'Details'}";
    } else {
      return null;
    }
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  }) { assert(mask != null); assert (separator != null); }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.length > 0) {
      if(newValue.text.length > oldValue.text.length) {
        if(newValue.text.length > mask.length) return oldValue;
        if(newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
