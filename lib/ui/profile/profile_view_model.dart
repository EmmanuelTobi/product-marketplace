import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketplace/services/persistence_service.dart';
import 'package:marketplace/services/user_service.dart';
import 'package:marketplace/ui/auth/models/status_state_model.dart';
import 'package:marketplace/ui/auth/models/user_model.dart';
import 'package:marketplace/util/locator_setup.dart';

final profileUIStateNotifierProvider = StateNotifierProvider<ProfileUIStateNotifier, ProfileUIStateModel>(
      (ref) => ProfileUIStateNotifier(homeUIStateModel: ProfileUIStateModel(
      statusState: StatusState(isLoading: false)
  )),
);

class ProfileUIStateNotifier extends StateNotifier<ProfileUIStateModel> {
  final userService = serviceLocator<UserService>();
  final persistentService = serviceLocator<PersistenceService>();

  ProfileUIStateNotifier({
    required ProfileUIStateModel homeUIStateModel,
  }) : _homeUIStateModel = homeUIStateModel, super(ProfileUIStateModel());

  final ProfileUIStateModel? _homeUIStateModel;

  void initialise({Function? onCallback, Function? onErrorCallBack}) {
    state = _homeUIStateModel!;
    fetchUserData();
  }

  Future logOut() async {
    await persistentService.deleteAll();
  }

  Future<void> fetchUserData({Function? onCallback, Function? onErrorCallBack}) async {

    state = state.copyWith(
        statusState: state.statusState!.copyWith(
            isLoading: true
        )
    );

    await userService.fetchUserData().then((value) {

      state = state.copyWith(
          statusState: state.statusState!.copyWith(
              isLoading: false,
          ),
        userModelModel: userService.userModel
      );

      print(userService.userModel!.toJson().toString());

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

class ProfileUIStateModel {

  ProfileUIStateModel({
    this.statusState,
    this.userModelModel,
  });

  ProfileUIStateModel copyWith({
    StatusState? statusState,
    UserModel? userModelModel,
  }) =>
      ProfileUIStateModel(
        statusState: statusState ?? this.statusState,
        userModelModel: userModelModel ?? this.userModelModel,
      );

  StatusState? statusState;
  UserModel? userModelModel;

}