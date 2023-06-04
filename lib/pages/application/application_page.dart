import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/common/values/colors.dart';
import 'package:flutter_full_project/pages/application/bloc/app_event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'application_widgets.dart';
import 'bloc/app_bloc.dart';
import 'bloc/app_state.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              body: buildPage(state.index),
              bottomNavigationBar: Container(
                width: 375.w,
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20.h,
                    ),
                    topRight: Radius.circular(20.h),
                  ),
                  color: AppColors.primaryElement,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: AppColors.primaryElement,
                  unselectedItemColor: AppColors.primaryElementText,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state.index,
                  onTap: (value) {
                    // print(value);
                    // setState(() {
                    //   _index = value;
                    // });
                    context.read<AppBloc>().add(TriggerAppEvent(value));
                  },
                  elevation: 0,
                  items: bottomTabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
