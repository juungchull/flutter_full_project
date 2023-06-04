import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/common/routes/routes.dart';
import 'package:flutter_full_project/common/values/colors.dart';
import 'package:flutter_full_project/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.primaryText,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
          )),
          debugShowCheckedModeBanner: false,
          // home: const Welcome(),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // initialRoute: "/",
          // routes: {
          //   'myHomePage': (context) => MyHomePage(),
          //   'signIn': (context) => SignIn(),
          //   'register': (context) => Register(),
          // },
        ),
      ),
    );
  }
}
