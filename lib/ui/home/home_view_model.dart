import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketplace/services/product_service.dart';
import 'package:marketplace/ui/auth/models/status_state_model.dart';
import 'package:marketplace/ui/auth/models/user_model.dart';
import 'package:marketplace/ui/product/model/product_list_model.dart';
import 'package:marketplace/util/locator_setup.dart';

final homeUIStateNotifierProvider = StateNotifierProvider<HomeUIStateNotifier, HomeUIStateModel>(
      (ref) => HomeUIStateNotifier(homeUIStateModel: HomeUIStateModel(
      statusState: StatusState(isLoading: false)
  )),
);

class HomeUIStateNotifier extends StateNotifier<HomeUIStateModel> {
  final productService = serviceLocator<ProductService>();

  HomeUIStateNotifier({
    required HomeUIStateModel homeUIStateModel,
  }) : _homeUIStateModel = homeUIStateModel, super(HomeUIStateModel());

  final HomeUIStateModel? _homeUIStateModel;

  void initialise({Function? onCallback, Function? onErrorCallBack}) {
    state = _homeUIStateModel!;
    fetchData();
  }

  Future<void> fetchData({Function? onCallback, Function? onErrorCallBack}) async {

    state = state.copyWith(
        statusState: state.statusState!.copyWith(
            isLoading: true
        )
    );

    await productService.fetchProducts().then((value) {

      state = state.copyWith(
          statusState: state.statusState!.copyWith(
              isLoading: false
          ),
        productListModel: productService.productListModel
      );

    }).onError((error, stackTrace) {
      print(stackTrace.toString());

      state = state.copyWith(
          statusState: state.statusState!.copyWith(
              isLoading: false
          )
      );

    });

  }

}

class HomeUIStateModel {

  HomeUIStateModel({
    this.statusState,
    this.userModelModel,
    this.productListModel
  });

  HomeUIStateModel copyWith({
    StatusState? statusState,
    UserModel? userModelModel,
    List<ProductModel>? productListModel,
  }) =>
      HomeUIStateModel(
        statusState: statusState ?? this.statusState,
        userModelModel: userModelModel ?? this.userModelModel,
        productListModel: productListModel ?? this.productListModel,
      );

  StatusState? statusState;
  UserModel? userModelModel;
  List<ProductModel>? productListModel;

}