import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/common/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/welcome_bloc.dart';
import 'bloc/welcome_event.dart';
import 'bloc/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(body: BlocBuilder<WelcomeBloc, WelcomeState>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                  },
                  children: [
                    _page(
                      1,
                      context,
                      'next',
                      'First see Learning',
                      'Forget about a for of paper all knowledge in on learning',
                      'assets/images/reading.png',
                    ),
                    _page(
                      2,
                      context,
                      'next',
                      'Connect With Everyone',
                      'Always keep in touch with your tutor & friend. let\'s get connected!',
                      'assets/images/boy.png',
                    ),
                    _page(
                      3,
                      context,
                      'Get Started',
                      'Always Fascinated Learning',
                      'Anywhere, anyTime. The time is at your descretion so study whenever you want.',
                      'assets/images/man.png',
                    ),
                  ],
                ),
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page.toInt(),
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Colors.blue,
                      size: Size.square(8.0),
                      activeSize: Size(20.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )),
    );
  }

  Widget _page(
    int index,
    BuildContext context,
    String buttonName,
    String title,
    String subTitle,
    String imagePath,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
          ),
          child: Text(
            subTitle,
            style: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            } else {
              //jump to new page
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => MyHomePage(title: title),
              //   ),
              // );
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/sign_in', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(15.w),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Center(
                child: Text(
              buttonName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            )),
          ),
        )
      ],
    );
  }
}
