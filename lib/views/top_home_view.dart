import 'package:badges/badges.dart' as b;
import 'package:flutter/material.dart';
import 'package:marketplace/util/colors.dart';
import 'package:marketplace/util/size_config.dart';

class TopHomeView extends StatelessWidget {
  const TopHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: SizeConfig.screenWidthDp! - 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: XColors.background().withOpacity(0.2),
                  width: 1,
                )
            ),
            child: const Padding(
              padding: EdgeInsets.all(9.0),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black26,),
                  SizedBox(width: 15,),
                  Text('Search', style: TextStyle(
                      fontWeight: FontWeight.w400,
                    color: Colors.black26,
                    fontSize: 15
                  ),),
                ],
              ),
            ),
          ),
          SizedBox(width: SizeConfig().sw(16).toDouble(),),
          b.Badge(
            badgeColor: const Color(0xFFE55986),
            shape: b.BadgeShape.circle,
            badgeContent: const Text('1', style: TextStyle(
                fontWeight: FontWeight.w600
            ),),
            borderRadius: BorderRadius.circular(4),
            child: const Padding(
              padding: EdgeInsets.all(7.0),
              child: Icon(Icons.shopping_basket_outlined, color: Colors.black54,),
            ),
          ),
          const SizedBox(width: 18,),
        ],
      ),
    );
  }
}

