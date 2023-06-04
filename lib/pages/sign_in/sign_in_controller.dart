import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/common/widgets/flutter_toast.dart';
import 'package:flutter_full_project/pages/sign_in/bloc/sign_in_bloc.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        //BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          // print('email is empty');
          toastInfo(msg: 'You need to fill email address');
          return;
        }
        if (password.isEmpty) {
          //
          // print('password is empty');
          toastInfo(msg: 'You need to fill password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
            // print('user does not exist');
            toastInfo(msg: 'You don\'t exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            //
            // print('not varified');
            toastInfo(msg: 'You need to verify your email account');
            return;
          }

          var user = credential.user;
          if (user != null) {
            //We got verified user from firebase
            print('user exist');
            Navigator.of(context)
                .pushNamedAndRemoveUntil("/application", (route) => false);
          } else {
            //We have error getting user from firebase
            // print('no user');
            toastInfo(msg: 'Currently you are not a user of this app');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            // print('No user found for that email.');
            toastInfo(msg: 'No user found for that email');
            //toastInfo (msg: 'No user found for that email');
          } else if (e.code == 'wrong-password') {
            //toastInfo(msg:'Wrong password provided for that user.');
            // print('Wrong password provided for that user.');
            toastInfo(msg: 'Wrong passwor provided for that user');
          } else if (e.code == 'invalid-email') {
            // print('Your email format is wrong');
            toastInfo(msg: 'Your email format is wrong');
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
