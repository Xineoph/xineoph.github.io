import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_test/data/repository/repository.dart';
import 'package:nasa_test/presentation/main_page/cubit/main_page_cubit.dart';
import 'package:nasa_test/presentation/main_page/main_page.dart';

void main() {
  final di = GetIt.instance;
  di.registerSingleton<DataRepository>(DataRepository());
  di.registerSingleton<MainPageCubit>(MainPageCubit(di<DataRepository>())..init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}
