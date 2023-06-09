import 'package:flutter/material.dart';
import 'package:flutter_full_project/common/widgets/base_text_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppbar() {
  return AppBar(
    title: Container(
      child: Container(
        child: reusableMenuText("Settings"),
      ),
    ),
  );
}

Widget settingsButton(BuildContext context, void Function()? func) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Confirm logout"),
            content: Text("Confirm logout"),
            actions: [
              TextButton(
                onPressed: func,
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel"),
              ),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/icons/Logout.png"),
        ),
      ),
    ),
  );
}
