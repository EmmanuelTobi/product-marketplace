import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketplace/ui/auth/signin_view.dart';
import 'package:marketplace/ui/profile/profile_view_model.dart';
import 'package:marketplace/util/colors.dart';
import 'package:marketplace/util/navigator.dart';
import 'package:marketplace/views/loader.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {

      Future.microtask(() => {
        ref.read(profileUIStateNotifierProvider.notifier).initialise()
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    final state = ref.watch(profileUIStateNotifierProvider);
    final actions = ref.read(profileUIStateNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: XColors.white(),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              if(state.statusState?.isLoading == false && state.userModelModel != null) ... [

                const Icon(
                  Icons.account_circle_outlined,
                  size: 65,
                  color: Colors.black,
                ),

                const SizedBox(height: 45,),

                const Divider(
                  color: Colors.black12,
                  thickness: 0.5,
                ),
                const Text('Profile', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 12
                ),),

                const SizedBox(height: 25,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Full name', style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black12,
                        fontSize: 12
                    ),),
                    Text('${state.userModelModel!.name!.firstname!} ${state.userModelModel!.name!.lastname!}', style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12
                    ),),
                  ],
                ),

                const SizedBox(height: 15,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email', style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black12,
                        fontSize: 12
                    ),),
                    Text(state.userModelModel!.email!, style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12
                    ),),
                  ],
                ),

                const SizedBox(height: 15,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Phone number', style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black12,
                        fontSize: 12
                    ),),
                    Text(state.userModelModel!.phone!, style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12
                    ),),
                  ],
                ),

                const SizedBox(height: 45,),

                const Divider(
                  color: Colors.black12,
                  thickness: 0.5,
                ),
                const Text('Address', style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 12
                ),),

                const SizedBox(height: 25,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('City', style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black12,
                        fontSize: 12
                    ),),
                    Text(state.userModelModel!.address!.city!, style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12
                    ),),
                  ],
                ),

                const SizedBox(height: 65,),

                GestureDetector(
                  onTap: () {

                    actions.logOut().then((value) {
                      popToFirst(context);
                      navigateReplace(context, const SignIn());
                    });

                  },
                  child: const Text('Log out', style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                      fontSize: 15
                  ),),
                ),

              ] else ... [

                const Loader(),

              ],

            ],
          ),
        ),
      ),
    );
  }
}