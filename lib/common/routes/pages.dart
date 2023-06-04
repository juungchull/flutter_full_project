//unify BlocProvider and routes and pages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/common/routes/names.dart';
import 'package:flutter_full_project/global.dart';
import 'package:flutter_full_project/pages/application/application_page.dart';
import 'package:flutter_full_project/pages/application/bloc/app_bloc.dart';
import 'package:flutter_full_project/pages/register/bloc/register_bloc.dart';
import 'package:flutter_full_project/pages/register/register.dart';
import 'package:flutter_full_project/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_full_project/pages/sign_in/sign_in.dart';
import 'package:flutter_full_project/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_full_project/pages/welcome/welcome.dart';

class PageEntity {
  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });

  dynamic bloc;
  Widget page;
  String route;
}

//return all blocprovider
class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(
          create: (_) => AppBloc(),
        ),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen  as we click on navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    //check for route name matching when navigator gets triggered.
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      print("valid route name ${settings.name}");

      if (result.isNotEmpty) {
        print("first log");
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedIn();
          if (isLoggedIn) {
            return MaterialPageRoute(
                builder: (_) => ApplicationPage(), settings: settings);
          }
          print("second log");
          return MaterialPageRoute(
              builder: (_) => SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    print("valid route name ${settings.name}");

    return MaterialPageRoute(builder: (_) => SignIn(), settings: settings);
  }
}
