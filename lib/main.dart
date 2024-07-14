import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:marketplace/services/persistence_service.dart';
import 'package:marketplace/ui/auth/signin_view.dart';
import 'package:marketplace/ui/auth/signup_view.dart';
import 'package:marketplace/util/locator_setup.dart';
import 'package:marketplace/util/size_config.dart';

void main() async {

  await locatorSetup();
  await PersistenceService.getInstance();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    SizeConfig.init(context, width: size.width, height: size.height, allowFontScaling: true);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFFFFFFF),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        fontFamily: "Montserrat",
      ),
      home: const SignIn(),
    );
  }
}
