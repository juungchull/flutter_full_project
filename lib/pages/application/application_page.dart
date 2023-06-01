import 'package:flutter/material.dart';
import 'package:flutter_full_project/common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  _ApplicationPageState createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
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
              currentIndex: _index,
              onTap: (value) {
                // print(value);
                setState(() {
                  _index = value;
                });
              },
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  label: "home",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset('assets/icons/home.png'),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/home.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "search",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset('assets/icons/search2.png'),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/search2.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "course",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset('assets/icons/play-circle1.png'),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/play-circle1.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "chat",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset('assets/icons/message-circle.png'),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/message-circle.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "profile",
                  icon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset('assets/icons/person2.png'),
                  ),
                  activeIcon: SizedBox(
                    width: 15.w,
                    height: 15.h,
                    child: Image.asset(
                      'assets/icons/person2.png',
                      color: AppColors.primaryElement,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
