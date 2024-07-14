import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketplace/ui/auth/auth_view_model.dart';
import 'package:marketplace/ui/auth/signin_view.dart';
import 'package:marketplace/ui/home/home_ui.dart';
import 'package:marketplace/util/button.dart';
import 'package:marketplace/util/inputfield.dart';
import 'package:marketplace/util/navigator.dart';
import 'package:marketplace/util/size_config.dart';
import 'package:marketplace/util/snackbar.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {

  final TextEditingController? emailController =  TextEditingController();
  final TextEditingController? passwordController =  TextEditingController();
  final TextEditingController? firstnameController =  TextEditingController();
  final TextEditingController? lastnameController =  TextEditingController();
  final TextEditingController? usernameController =  TextEditingController();
  final TextEditingController? streetController =  TextEditingController();
  final TextEditingController? cityController =  TextEditingController();


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authStateNotifierProvider.notifier).initialise();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {

          final state = ref.watch(authStateNotifierProvider);
          final actions = ref.read(authStateNotifierProvider.notifier);

          return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: SizeConfig.screenHeightDp! - 10,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(child: SizedBox(height: SizeConfig().sh(20).toDouble(),)),

                    const Text(
                      'Sign up into our Marketplace app',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24
                      ),),
                    SizedBox(height: SizeConfig().sh(50).toDouble(),),
                    Row(
                      children: [
                        Expanded(
                          child: MainInputField(
                            label: "First name",
                            isEnabled: true,
                            controller: firstnameController,
                          ),
                        ),
                        SizedBox(width: SizeConfig().sh(20).toDouble(),),
                        Expanded(
                          child: MainInputField(
                            label: "Last name",
                            isEnabled: true,
                            controller: lastnameController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: SizeConfig().sh(20).toDouble(),),
                    MainInputField(
                      label: "Username",
                      isEnabled: true,
                      controller: usernameController,
                    ),
                    SizedBox(height: SizeConfig().sh(20).toDouble(),),
                    MainInputField(
                      label: "Email address",
                      isEnabled: true,
                      validator: EmailValidator.validate,
                      controller: emailController,
                    ),

                    SizedBox(height: SizeConfig().sh(20).toDouble(),),

                    MainInputField(
                      label: "Password",
                      validator: PasswordValidator.validate,
                      isEnabled: true,
                      isPassword: true,
                      controller: passwordController,
                    ),

                    SizedBox(height: SizeConfig().sh(20).toDouble(),),

                    const Divider(
                        thickness: 0.4,
                      color: Colors.black12,),

                    SizedBox(height: SizeConfig().sh(20).toDouble(),),
                    MainInputField(
                      label: "City",
                      isEnabled: true,
                      controller: cityController,
                    ),
                    SizedBox(height: SizeConfig().sh(20).toDouble(),),
                    MainInputField(
                      label: "Street",
                      isEnabled: true,
                      controller: streetController,
                    ),

                    SizedBox(height: SizeConfig().sh(40).toDouble(),),

                    XButton(
                      onClick: () {

                        if(emailController!.text.isNotEmpty &&
                            usernameController!.text.isNotEmpty &&
                            passwordController!.text.isNotEmpty &&
                            firstnameController!.text.isNotEmpty &&
                            lastnameController!.text.isNotEmpty) {

                          actions.signupUser(
                              regData:  {
                                'email': emailController!.text,
                                'username': usernameController!.text,
                                'password': passwordController!.text,
                                'name':{
                                  'firstname': firstnameController!.text,
                                  'lastname': lastnameController!.text
                                },
                                'address':{
                                  'city': cityController!.text,
                                  'street': streetController!.text,
                                  'number': 3,
                                  'zipcode': '12926-3874',
                                  'geolocation':{
                                    'lat': '-37.3159',
                                    'long': '81.1496'
                                  }
                                },
                                'phone': '1-570-236-7033'
                              },
                              onCallback: () {
                                navigateReplace(context, const HomeUI());
                              },
                              onErrorCallBack: () {

                                showSnackBar(
                                    context: context,
                                    message: 'Error with creating your account',
                                    error: true
                                );

                              }
                          );

                        } else {

                          showSnackBar(
                              context: context,
                              message: 'Input all fields completely',
                              error: true
                          );

                        }

                      },
                      text: 'Sign up',
                      width: SizeConfig.screenWidthDp,
                      textColor: Colors.white,
                      isLoading: state.statusState?.isLoading! ?? false,
                    ),

                    SizedBox(height: SizeConfig().sh(20).toDouble(),),

                    Row(
                      children: [
                        const Text('Have an account already?', style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12
                        ),),
                        SizedBox(width: SizeConfig().sw(15).toDouble(),),
                        GestureDetector(
                          onTap: () {
                            navigateReplace(context, const SignIn());
                          },
                          child: const Text('Sign in', style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14
                          ),),
                        ),
                      ],),
                  ],),
              ),
            ),
          ),
        );
      }
    );
  }
}