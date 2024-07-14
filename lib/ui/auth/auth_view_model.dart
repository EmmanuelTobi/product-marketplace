import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketplace/services/auth_service.dart';
import 'package:marketplace/services/persistence_service.dart';
import 'package:marketplace/ui/auth/models/status_state_model.dart';
import 'package:marketplace/ui/auth/models/user_model.dart';
import 'package:marketplace/util/locator_setup.dart';

final authStateNotifierProvider = StateNotifierProvider<AuthStateNotifier, AuthStateModel>(
      (ref) => AuthStateNotifier(authStateModel: AuthStateModel(
          statusState: StatusState(isLoading: false)
      )),
);

class AuthStateNotifier extends StateNotifier<AuthStateModel> {
  final authService = serviceLocator<AuthService>();
  final persistService = serviceLocator<PersistenceService>();

  AuthStateNotifier({
    required AuthStateModel authStateModel,
  }) : _authStateModel = authStateModel, super(AuthStateModel());

  final AuthStateModel? _authStateModel;

  void initialise({Function? onLoggedCallBack, Function? onNewCallBack}) {
    state = _authStateModel!;

    if(persistService.getUserToken != null) {

      if(onLoggedCallBack != null) {
        onLoggedCallBack();
      }

    } else {

      if(onNewCallBack != null) {
        onNewCallBack();
      }

    }

  }

  Future<void> loginUser({Function? onCallback, Function? onErrorCallBack, String? email, String? password}) async {

    state = state.copyWith(
        statusState: state.statusState!.copyWith(
            isLoading: true
        )
    );

    await authService.loginUser(
      email: email,
      password: password
    ).then((value) {

      state = state.copyWith(
          statusState: state.statusState!.copyWith(
              isLoading: false
          )
      );

      onCallback!();

    }).onError((error, stackTrace) {
      print(stackTrace.toString());

      state = state.copyWith(
          statusState: state.statusState!.copyWith(
              isLoading: false
          )
      );

    });

  }

  Future<void> signupUser({Function? onCallback, Function? onErrorCallBack, Map<String, dynamic>? regData}) async {

    state = state.copyWith(
        statusState: state.statusState!.copyWith(
            isLoading: true
        )
    );

    await authService.createUser(
        data: regData
    ).then((value) {

      state = state.copyWith(
          statusState: state.statusState!.copyWith(
              isLoading: false
          )
      );

      onCallback!();

    }).onError((error, stackTrace) {
      print(stackTrace.toString());

      state = state.copyWith(
          statusState: state.statusState!.copyWith(
              isLoading: false
          )
      );

      onErrorCallBack!();

    });

  }

}

class AuthStateModel {

  AuthStateModel({
    this.statusState,
    this.userModelModel
  });

  AuthStateModel copyWith({
    StatusState? statusState,
    UserModel? userModelModel,
  }) =>
      AuthStateModel(
        statusState: statusState ?? this.statusState,
        userModelModel: userModelModel ?? this.userModelModel,
      );

  StatusState? statusState;
  UserModel? userModelModel;

}