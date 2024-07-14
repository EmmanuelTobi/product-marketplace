import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({
    super.key,
    this.index,
    this.name,
    this.image,
    this.cost,
    this.counts,
    this.rating,
    this.category,
    this.onFavourite
  });

  final int? index;
  final String? image;
  final String? name;
  final String? rating;
  final String? counts;
  final String? cost;
  final String? category;
  final Function? onFavourite;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Stack(children: [
        Container(
          color: Colors.black12.withOpacity(0.03),
          width: 330,
          height: 150,
            //width: 60,
            child: Hero(
                tag: 'item_$index',
            child: Image.network(image!))
        ),
        Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => onFavourite!(),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.black12.withOpacity(0.05)
                ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.favorite_border, color: Colors.black38,),
                  )
              ),
            )
        )
      ],),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12,),
          Text(category ?? 'Shirt', style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black26
          ),),
          const SizedBox(height: 6,),
          Text(
            name ?? 'Essential Men Short-Sleeve',
            maxLines: 3,
            style: const TextStyle(
            fontSize: 12,
              fontWeight: FontWeight.w700
          ),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.star_rate_rounded, color: Colors.green, size: 14,),
                  const SizedBox(width: 5,),
                  Text('${rating ?? 0.0} | ${counts ?? 0}', style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    fontSize: 12
                  ),),
                ],
              ),

              Text('\$${cost ?? 0.0}', style: const TextStyle(
                  fontWeight: FontWeight.w700,
                fontSize: 13
              ),),
            ],
          ),
        ],
      ),
    ],);
  }
}