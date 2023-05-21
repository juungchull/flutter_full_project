import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'register_state.dart';

part 'register_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState()) {
    on<RegisterEvent>((event, emit) {});
  }
}
