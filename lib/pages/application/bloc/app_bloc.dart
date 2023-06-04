import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/pages/application/bloc/app_event.dart';
import 'package:flutter_full_project/pages/application/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<TriggerAppEvent>(
      (event, emit) {
        emit(AppState(index: event.index));
      },
    );
  }
}
