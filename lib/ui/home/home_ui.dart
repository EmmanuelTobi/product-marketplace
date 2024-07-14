import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketplace/ui/home/home_view_model.dart';
import 'package:marketplace/ui/home/item_details_ui.dart';
import 'package:marketplace/ui/profile/profile_view.dart';
import 'package:marketplace/util/colors.dart';
import 'package:marketplace/util/navigator.dart';
import 'package:marketplace/views/item_list_view.dart';
import 'package:marketplace/views/slider_view.dart';
import 'package:marketplace/views/top_home_view.dart';
import 'package:shimmer/shimmer.dart';

class HomeUI extends ConsumerStatefulWidget {
  const HomeUI({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeUIState();
}

class _HomeUIState extends ConsumerState<HomeUI> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      Future.microtask(() => {
        ref.read(homeUIStateNotifierProvider.notifier).initialise()
      });

    });
  }

  List<Map<String, dynamic>> filterSet = [
    {
      "name" : 'Category',
      "icon" : Icon(Icons.category_outlined, color: const Color(0xFF2B2D41).withOpacity(0.8),),
    },
    // {
    //   "name" : 'Flight',
    //   "icon" : Icon(Icons.flight_rounded, color: const Color(0xFF2B2D41).withOpacity(0.8),),
    // },
    // {
    //   "name" : 'Bill',
    //   "icon" : Icon(Icons.receipt_rounded, color: const Color(0xFF2B2D41).withOpacity(0.8),),
    // },
    // {
    //   "name" : 'Data plan',
    //   "icon" : Icon(Icons.data_usage_rounded, color: const Color(0xFF2B2D41).withOpacity(0.8),),
    // },
    // {
    //   "name" : 'Top up',
    //   "icon" : Icon(Icons.monetization_on_outlined, color: const Color(0xFF2B2D41).withOpacity(0.8),),
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {

          final state = ref.watch(homeUIStateNotifierProvider);
          final actions = ref.read(homeUIStateNotifierProvider.notifier);

          return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                pinned: true,
                backgroundColor: XColors.white(),
                elevation: 0,
                collapsedHeight: 56,
                expandedHeight: 280,
                centerTitle: true,
                automaticallyImplyLeading: false,
                titleSpacing: 0,
                leading: GestureDetector(
                  onTap: () {
                    navigate(context, const ProfileView());
                  },
                  child: const Icon(
                    Icons.account_circle_outlined,
                    size: 35,
                    color: Colors.black,
                  ),
                ),
                title: const Column(
                  children: [
                    SizedBox(height: 10,),
                    TopHomeView(),
                    SizedBox(height: 10,),
                  ],
                ),
                flexibleSpace: const FlexibleSpaceBar(
                  centerTitle: true,
                  background: Stack(
                    children: [
                      SliderView(),
                    ],
                  ),
                ),
              ),
           SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 26,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    ...List.generate(filterSet.length, (index) => Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              child: Padding (
                                padding: const EdgeInsets.all(5),
                                child: filterSet[index]['icon'],
                              ),
                            ),
                            const SizedBox(height: 16,),
                            Text(filterSet[index]['name'], style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black26
                            ),),
                          ],
                        ),
                      ],
                    ))
                  ],),
                  const SizedBox(height: 32,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Best Sale Product', style: TextStyle(
                          fontWeight: FontWeight.w700,
                        fontSize: 19
                      ),),
                      Text('see more', style: TextStyle(
                          fontWeight: FontWeight.w500,
                        color: Colors.black26
                      ),),
                    ],
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    height: 160 * (state.productListModel?.length.toDouble() ?? 11),
                    child: GridView.builder(
                      itemCount: state.productListModel?.length ?? 7,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 23,
                          mainAxisSpacing: 26,
                          mainAxisExtent: 291),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            navigate(context, ItemDetailsUI(
                              currentImgTag: 'item_$index',
                              productModel: state.productListModel![index],
                            ));
                          },
                          child: state.statusState?.isLoading ?? false == true || state.productListModel == null ? SizedBox(
                            width: 200.0,
                            height: 100.0,
                            child: Shimmer.fromColors(
                              baseColor: XColors.primaryColor().withOpacity(0.5),
                              highlightColor: XColors.textGrey().withOpacity(0.4),
                              child: Container(
                                color: Colors.black,
                              ),
                            ),
                          ) : ItemsView(
                            index: index,
                            image: state.productListModel![index].image,
                            name: state.productListModel![index].title,
                            rating: state.productListModel![index].rating!.rate.toString(),
                            category: state.productListModel![index].category,
                            cost: state.productListModel![index].price.toString(),
                            counts: state.productListModel![index].rating!.count.toString(),
                            onFavourite: () {

                            },
                          ),

                        );
                      },
                    ),
                  )
                ],
              ),
            )),
            ],
          ),
        );
      }
    );
  }
}
