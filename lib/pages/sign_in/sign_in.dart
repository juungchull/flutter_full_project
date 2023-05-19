import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                  child: reusableText('Or use your email account login'),
                ),
                Container(
                  padding: EdgeInsets.only(left: 25.w),
                  margin: EdgeInsets.only(top: 66.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Email'),
                      SizedBox(height: 5.h),
                      buildTextField(
                          'Enter your email address', 'email', 'user'),
                      reusableText('Password'),
                      SizedBox(height: 5.h),
                      buildTextField('Enter your password', 'password', 'lock'),
                    ],
                  ),
                ),
                forgotPassword(),
                buildLogInAndRegButton('Log In', 'login'),
                buildLogInAndRegButton('Resister', 'resister'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
