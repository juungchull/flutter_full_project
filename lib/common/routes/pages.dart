//unify BlocProvider and routes and pages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/common/routes/names.dart';
import 'package:flutter_full_project/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_full_project/pages/welcome/welcome.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    required this.bloc,
  });
}

class AppPages {
  List<PageEntity> routes = [
    PageEntity(
      route: AppRoutes.INITIAL,
      page: Welcome(),
      bloc: BlocProvider(
        create: (_) => WelcomeBloc(),
      ),
    ),
  ];
}
