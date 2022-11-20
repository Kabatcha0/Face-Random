import 'package:bloc/bloc.dart';
import 'package:facegenerate/cubit/cubit.dart';
import 'package:facegenerate/cubit/states.dart';
import 'package:facegenerate/modules/facerandom.dart';
import 'package:facegenerate/sahred/blocobserver.dart';
import 'package:facegenerate/sahred/local/local.dart';
import 'package:facegenerate/sahred/network/network.dart';
import 'package:facegenerate/sahred/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cache.init();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  bool? toggle = Cache.getData(key: "toggle");
  print(toggle);
  runApp(MyApp(
    toggle,
  ));
}

class MyApp extends StatelessWidget {
  MyApp(this.toggleMode, {super.key});
  final bool? toggleMode;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaceRandomCubit()..change(change: toggleMode),
      child: BlocConsumer<FaceRandomCubit, FaceRandomStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = FaceRandomCubit.get(context);
          return MaterialApp(
            themeMode: cubit.toggleMode ? ThemeMode.light : ThemeMode.dark,
            theme: theme,
            darkTheme: themeDark,
            debugShowCheckedModeBanner: false,
            home: FaceRandom(),
          );
        },
      ),
    );
  }
}
