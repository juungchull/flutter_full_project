import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/pages/register/bloc/register_bloc.dart';
import 'package:flutter_full_project/pages/register/bloc/register_event.dart';
import 'package:flutter_full_project/pages/register/register_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common_widgets.dart';
import 'bloc/register_state.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Sign Up'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: reusableText(
                          'Enter your details below & free sign up'),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25.w),
                      margin: EdgeInsets.only(top: 66.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('User name'),
                          buildTextField('Enter your user name', 'user', 'user',
                              (value) {
                            // context.read<SignInBloc>().add(EmailEvent(value));
                            context
                                .read<RegisterBloc>()
                                .add(UserNameEvent(value));
                          }),
                          reusableText('Email'),
                          buildTextField(
                              'Enter your email address', 'email', 'user',
                              (value) {
                            // context.read<SignInBloc>().add(EmailEvent(value));
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          }),
                          reusableText('Password'),
                          buildTextField(
                              'Enter your Password', 'password', 'lock',
                              (value) {
                            // context
                            //     .read<SignInBloc>()
                            //     .add(PasswordEvent(value));
                          }),
                          reusableText('Confirm Password'),
                          buildTextField(
                              'Enter your Confirm Password', 'password', 'lock',
                              (value) {
                            // context
                            //     .read<SignInBloc>()
                            //     .add(PasswordEvent(value));
                          }),
                        ],
                      ),
                    ),
                    Container(
                      width: 280.w,
                      padding: EdgeInsets.only(left: 25.w),
                      child: reusableText(
                          'By creating an account you have to agree with our them & condication.'),
                    ),
                    buildLogInAndRegButton('Sign up', 'login', () {
                      // Navigator.of(context).pushNamed('register');
                      RegisterController(context: context)
                          .handleEmailRegister();
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
