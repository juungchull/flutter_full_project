import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_event.dart';
import 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState()) {
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingsEvent event, Emitter<SettingsState> emit) {
    emit(SettingsState());
  }
}
