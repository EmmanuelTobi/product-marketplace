import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/util/colors.dart';

class SliderView extends StatelessWidget {
  const SliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF7D919F).withOpacity(0.6),
      child: Stack(
        children: [
          Positioned(
            top: 95,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('#FASHION DAY', style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13
                  ),),
                  const SizedBox(height: 5,),
                  const Text('80% OFF', style: TextStyle(
                      fontWeight: FontWeight.w800,
                    fontSize: 28
                  ),),
                  const SizedBox(height: 2,),
                  Container(
                    width: 190,
                    child: const Text('Discover fashion that suits to your style', style: TextStyle(
                        fontWeight: FontWeight.w500,
                      fontSize: 13
                    ),),
                  ),
                  const SizedBox(height: 12,),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF2B2D41),
                      borderRadius: BorderRadius.circular(9),
                    ),
                    height: 40,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text('Check this out', style: TextStyle(
                            fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 12
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],),
    );
  }
}
