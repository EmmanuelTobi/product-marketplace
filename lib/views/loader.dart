import 'package:flutter/material.dart';
import 'package:marketplace/util/colors.dart';


class Loader extends StatelessWidget {

  const Loader(
      {Key? key,
        this.opacity = 1.0,
        this.strokeWidth = 5,
        this.width = 40,
        this.bgProgressColor,
        this.height = 40})
      : super(key: key);

  final double opacity;
  final double strokeWidth;
  final double height;
  final double width;
  final Color? bgProgressColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: 20,
        width: 20,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: XColors.primaryColor(),
            strokeWidth: strokeWidth,
            valueColor: AlwaysStoppedAnimation<Color>(bgProgressColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
