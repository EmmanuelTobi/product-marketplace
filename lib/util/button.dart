import 'package:flutter/material.dart';
import 'package:marketplace/util/colors.dart';
import 'package:marketplace/views/loader.dart';

class XButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Function onClick;
  final String? text;
  final double? radius;
  final Color? buttonColor;
  final Color? textColor;
  final double? textSize;
  final bool isLoading;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final Widget? buttonWidget;

  const XButton({
    Key? key,
    required this.onClick,
    this.text,
    this.height,
    this.width,
    this.radius,
    this.buttonColor,
    this.textColor,
    this.textSize,
    this.isLoading = false,
    this.fontWeight,
    this.borderColor,
    this.buttonWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor ?? XColors.background()),
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(Size(width ?? 300, height ?? 56)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 28),
          ),
        ),
      ),
      child: !isLoading ? buttonWidget ?? Text( text ?? 'Continue', style: TextStyle(
          fontWeight: FontWeight.w600,
        color: textColor ?? Colors.white
      ),) : const Loader(),
      onPressed: () => !isLoading ? onClick() : (){},
    );
  }
}