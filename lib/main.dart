import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_full_project/app_blocs.dart';
import 'package:flutter_full_project/app_events.dart';
import 'package:flutter_full_project/app_state.dart';
import 'package:flutter_full_project/common/routes/pages.dart';
import 'package:flutter_full_project/common/values/colors.dart';
// import 'package:flutter_full_project/pages/welcome/welcome.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/welcome/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: AppColors.primaryText,
            ),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
          )),
          debugShowCheckedModeBanner: false,
          // home: const Welcome(),
          onGenerateRoute: AppPages.GenerateRouteSettings,
          // initialRoute: "/",
          // routes: {
          //   'myHomePage': (context) => MyHomePage(),
          //   'signIn': (context) => SignIn(),
          //   'register': (context) => Register(),
          // },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'flutter home page demo',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(child: BlocBuilder<AppBlocs, AppStates>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${BlocProvider.of<AppBlocs>(context).state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          );
        },
      )),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: 'heroTag1',
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: 'heroTag2',
            onPressed: () =>
                BlocProvider.of<AppBlocs>(context).add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(
              Icons.remove,
            ),
          ),
        ],
      ),
    );
  }
}
