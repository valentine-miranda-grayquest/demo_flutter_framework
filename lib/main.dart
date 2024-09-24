import 'package:demo_flutter_project/HomeScreen.dart';
import 'package:demo_flutter_project/ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: BlocProvider(
          create: (context) => Viewmodel(),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
