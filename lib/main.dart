
import 'package:farm_hub/modules/layout/layout_screen.dart';
import 'package:farm_hub/modules/on_boarding/on_boarding.dart';
import 'package:farm_hub/shared/bloc_observ.dart';
import 'package:farm_hub/shared/network/local/cache_helper.dart';
import 'package:farm_hub/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  runApp( const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      home: AppLayout(),
    );
  }
}


