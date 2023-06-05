import 'package:flutter/material.dart';
import 'package:flutter_full_project/common/values/colors.dart';
import 'package:flutter_full_project/pages/home/widgets/home_page_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 25.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homePageText("Hello,", color: AppColors.primaryThreeElementText),
            homePageText("jungchul", top: 5),
            searchView(),
          ],
        ),
      ),
    );
  }
}
