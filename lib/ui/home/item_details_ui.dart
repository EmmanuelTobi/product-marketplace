import 'package:badges/badges.dart' as b;
import 'package:flutter/material.dart';
import 'package:marketplace/ui/product/model/product_list_model.dart';
import 'package:marketplace/util/colors.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ItemDetailsUI extends StatelessWidget {
  ItemDetailsUI({
    super.key,
    this.currentImgTag,
    this.productModel
  });

  final String? currentImgTag;
  final ProductModel? productModel;

  List<String> itemDescription = [
    'Long sleeve dress shirt in classic fit featuring button down colar',
    'Pitch Pocket on left chest',
    'Durable combination cotton fabric',
    'Comfortable and quality dress shirt',
    'Go to classic button down shirt for all special occasion'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: const Icon(Icons.arrow_back_ios, color: Colors.black38,)
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            const Icon(Icons.favorite_border, color: Colors.black38,),
            const SizedBox(width: 26,),
            const Icon(Icons.share_outlined, color: Colors.black38,),
              const SizedBox(width: 26,),
              b.Badge(
                badgeColor: const Color(0xFFE55986),
                shape: b.BadgeShape.circle,
                elevation: 0,
                badgeContent: const Text('1', style: TextStyle(
                    fontWeight: FontWeight.w600
                ),),
                borderRadius: BorderRadius.circular(6),
                child: const Icon(Icons.shopping_basket_outlined, color: Colors.black38,)
            ),
              const SizedBox(width: 16,),
          ],),
        ],
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Total price', style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black26
                ),),
                const SizedBox(height: 6,),
                Text('\$${productModel!.price!}', style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: Colors.black
                ),),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF4CB298),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(Icons.shopping_basket_outlined, color: Colors.white,),
                        SizedBox(width: 10,),
                        Text('1', style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFF2B2D41),
                      borderRadius: BorderRadius.only(topRight: Radius.circular(6), bottomRight: Radius.circular(6))
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Buy Now', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white
                    ),),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 15,),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: XColors.primaryColor().withOpacity(0.3),
                        width: 1,
                      )),
                  child: Hero(
                    tag: currentImgTag!,
                    child: Image.network(productModel!.image!),
                  ),
                ),
                const SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(children: [
                      Icon(Icons.storefront, color: Colors.black38,),
                      SizedBox(width: 5,),
                      Text('tokobaju.io', style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black38,
                        fontSize: 11
                      ),),
                    ],),
                    const SizedBox(height: 10,),
                    Text(productModel!.title!, style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.star_rounded, color: Colors.green,),
                            const SizedBox(width: 5,),
                            Text('${productModel!.rating!.rate} Ratings', style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black38
                            ),),
                          ],
                        ),
                        const Row(
                          children: [
                            Text('2.3k+ Reviews', style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black38
                            ),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('${productModel!.rating!.count} left', style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.black38
                            ),),
                          ],
                        ),
                      ],),
                    const SizedBox(height: 30,),
                    Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('About item', style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.black
                            ),),
                            Text('Reviews', style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.black
                            ),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(child: Divider(thickness: 2.5, color: Color(0xFF4BB197))),
                            Expanded(child: Divider(thickness: 0.5, color: const Color(0xFF2B2D41).withOpacity(0.3))),
                          ],
                        ),
                        // const SizedBox(height: 10,),
                        // const Row(
                        //   children: [
                        //     Text('Brand: ', style: TextStyle(
                        //         fontWeight: FontWeight.w600,
                        //         fontSize: 12,
                        //         color: Colors.black26
                        //     ),),
                        //     Text('-', style: TextStyle(
                        //         fontWeight: FontWeight.w700,
                        //         fontSize: 15,
                        //         color: Colors.black
                        //     ),),
                        //   ],
                        // ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            const Text('Category: ', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black26
                            ),),
                            Text(productModel!.category!, style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                                color: Colors.black
                            ),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Divider(thickness: 0.5, color: const Color(0xFF2B2D41).withOpacity(0.3)),
                    const SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Description:', style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Colors.black
                        ),),
                        const SizedBox(height: 10,),
                        ...List.generate(productModel!.description!.split(',').length, (index) {
                          String? descriptionText = productModel!.description!.split(',')[index];

                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Text('\u2022 ', style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Colors.black
                                ),),
                                const SizedBox(width: 5,),
                                Container(
                                  width: MediaQuery.of(context).size.width - 58,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(descriptionText, style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: Colors.black
                                      ),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Divider(thickness: 0.5, color: const Color(0xFF2B2D41).withOpacity(0.3)),
                    const SizedBox(height: 20,),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shipping information:', style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Colors.black
                        ),),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            Text('Delivery: ', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.black26
                            ),),
                            Text('Shipping from Dkaah, Indoneisa', style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black
                            ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Shipping: ', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.black26
                            ),),
                            Text('Free shipping international', style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black
                            ),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Text('Arrive: ', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                                color: Colors.black26
                            ),),
                            Text('Estimated arrival on 25 - 27th Oct 2022', style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.black
                            ),),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Divider(thickness: 0.5, color: const Color(0xFF2B2D41).withOpacity(0.3)),
                    const SizedBox(height: 20,),
                    const Text('Reviews & Ratings', style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Colors.black
                    ),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(children: [
                        Row(
                          children: [
                            Text(' ${productModel!.rating!.rate}', style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 45,
                                color: Colors.black
                            ),),
                            const Text('/5.0', style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.black26
                            ),),
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Row(
                          children: [
                            ...List.generate(5, (index) => const Icon(Icons.star_rate_rounded, color: Colors.green, size: 14,),)
                          ],
                        ),
                      ],),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...List.generate(5, (index) => Row(
                            children:  [
                              const Icon(Icons.star_rate_rounded, color: Colors.green, size: 23,),
                              Text((5 - index).toString(), style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black26
                              ),),
                              LinearPercentIndicator(
                                barRadius: const Radius.circular(21),
                                width: 170.0,
                                lineHeight: 10.0,
                                percent: (5 - index)/8.5,
                                progressColor: XColors.primaryColor(),
                              ),

                              if((5 - index) == 4) ... [
                                const Text('710', style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black
                                ),),
                              ] else if((5 - index) == 5) ... [
                                const Text('1.5k', style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black
                                ),),
                              ] else if((5 - index) == 3) ... [
                                const Text('140', style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black
                                ),),
                              ] else if((5 - index) == 2) ... [
                                const Text('10', style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black
                                ),),
                              ] else if((5 - index) == 1) ... [
                                const Text('4', style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: Colors.black
                                ),),
                              ]

                            ],
                          ),),
                        ],
                      )
                    ],),
                  ],
                )
              ],),
          ),
        ),
      ),
    );
  }

}
