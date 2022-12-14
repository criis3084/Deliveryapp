import 'package:delivery/src/pages/Register/register_page.dart';
import 'package:delivery/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Trip Advisor Toto',
      debugShowCheckedModeBanner:false ,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage())

      ],
      theme: ThemeData(
        primaryColor: Colors.amberAccent,
        colorScheme: ColorScheme(
            brightness: Brightness.light,
          onBackground: Colors.grey,
          secondary: Colors.amber,
          primary: Colors.orangeAccent,
          onPrimary: Colors.grey,
          surface: Colors.grey,
          onSurface: Colors.grey,
          error: Colors.grey,
          onError:Colors.grey,
            onSecondary: Colors.grey,
          background: Colors.grey,



        )
      ),
      navigatorKey: Get.key,
    );
  }
}
