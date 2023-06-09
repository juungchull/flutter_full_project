import 'package:flutter/material.dart';
import 'package:flutter_full_project/pages/profile/widgets/profile_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 6.w),
                child: Image(
                  width: 25.w,
                  height: 25.h,
                  image: AssetImage("assets/icons/edit_3.png"),
                ),
                width: 80.w,
                height: 80.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  image: DecorationImage(
                    image: AssetImage("assets/icons/headpic.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
