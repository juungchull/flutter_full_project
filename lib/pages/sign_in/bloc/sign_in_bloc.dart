import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) {});
    on<PasswordEvent>((event, emit) {});
  }
}
