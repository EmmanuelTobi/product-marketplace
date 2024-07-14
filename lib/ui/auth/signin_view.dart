import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketplace/ui/auth/auth_view_model.dart';
import 'package:marketplace/ui/auth/signup_view.dart';
import 'package:marketplace/ui/home/home_ui.dart';
import 'package:marketplace/util/button.dart';
import 'package:marketplace/util/inputfield.dart';
import 'package:marketplace/util/navigator.dart';
import 'package:marketplace/util/size_config.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {

  final TextEditingController? emailController =  TextEditingController();
  final TextEditingController? passwordController =  TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authStateNotifierProvider.notifier).initialise(
          onLoggedCallBack: () {
            navigateReplace(context, const HomeUI());
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {

          final state = ref.watch(authStateNotifierProvider);
          final actions = ref.read(authStateNotifierProvider.notifier);

          return Scaffold(
            body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
        
                  Expanded(child: SizedBox(height: SizeConfig().sh(20).toDouble(),)),
        
                  const Text(
                    'Welcome to our Marketplace app',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24
                  ),),
                  SizedBox(height: SizeConfig().sh(50).toDouble(),),
                  MainInputField(
                    label: "Email address",
                    isEnabled: true,
                    validator: EmailValidator.validate,
                  ),
        
                  SizedBox(height: SizeConfig().sh(20).toDouble(),),
        
                  MainInputField(
                    label: "Password",
                    validator: PasswordValidator.validate,
                    isEnabled: true,
                    isPassword: true,
                  ),
        
                  SizedBox(height: SizeConfig().sh(40).toDouble(),),
        
                  XButton(
                    onClick: () {

                      if(emailController!.text.isNotEmpty &&
                          passwordController!.text.isNotEmpty) {

                        actions.loginUser(
                            email: emailController!.text,
                            password: passwordController!.text,
                          onCallback: () {

                              navigateReplace(context, const HomeUI());

                          },
                        );

                      } else {

                      }

                    },
                    text: 'Login',
                    width: SizeConfig.screenWidthDp,
                    textColor: Colors.white,
                    //isLoading: true,
                    isLoading: state.statusState?.isLoading! ?? false,
                  ),
        
                  SizedBox(height: SizeConfig().sh(20).toDouble(),),
        
                  Row(
                    children: [
                    const Text('Don\'t have an account?', style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12
                    ),),
                    SizedBox(width: SizeConfig().sw(15).toDouble(),),
                    GestureDetector(
                      onTap: () {
                        navigateReplace(context, const SignUp());
                      },
                      child: const Text('Sign up', style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14
                      ),),
                    ),
                  ],),
              ],),
          ),
        );
      }
    );
  }
}