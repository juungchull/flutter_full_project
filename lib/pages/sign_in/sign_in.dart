import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/pages/sign_in/bloc/sign_in_event.dart';
import 'package:flutter_full_project/pages/sign_in/sign_in_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/sign_in_bloc.dart';
import 'bloc/sign_in_state.dart';
import '../common_widgets.dart';
// import 'widgets/sign_in_widget.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Sign In'),
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
                              'Enter your email address', 'email', 'user',
                              (value) {
                            context.read<SignInBloc>().add(EmailEvent(value));
                          }),
                          reusableText('Password'),
                          SizedBox(height: 5.h),
                          buildTextField(
                              'Enter your password', 'password', 'lock',
                              (value) {
                            context
                                .read<SignInBloc>()
                                .add(PasswordEvent(value));
                          }),
                        ],
                      ),
                    ),
                    forgotPassword(),
                    SizedBox(
                      height: 70.h,
                    ),
                    buildLogInAndRegButton('Log In', 'login', () {
                      SignInController(context: context).handleSignIn("email");
                    }),
                    buildLogInAndRegButton('Sign Up', 'register', () {
                      Navigator.of(context).pushNamed('/register');
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
