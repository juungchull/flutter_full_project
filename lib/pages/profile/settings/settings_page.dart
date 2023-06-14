import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/common/routes/names.dart';
import 'package:flutter_full_project/common/values/constant.dart';
import 'package:flutter_full_project/pages/application/bloc/app_bloc.dart';
import 'package:flutter_full_project/pages/application/bloc/app_event.dart';
import 'package:flutter_full_project/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:flutter_full_project/pages/profile/settings/bloc/settings_state.dart';
import 'package:flutter_full_project/pages/profile/settings/widgets/settings_widgets.dart';

import '../../../global.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    context.read<AppBloc>().add(TriggerAppEvent(0));
    Global.storageService.remove(AppConstant.STORAGE_USER_PROFILE_KEY);

    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, removeUserData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
