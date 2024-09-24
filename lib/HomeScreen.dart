import 'package:demo_flutter_project/ViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  HomeScreenState();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<Viewmodel>();

    viewModel.handleMethodsHandler();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              style: const TextStyle(fontWeight: FontWeight.w500),
              onChanged: (value) {
                viewModel.nativeData = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: TextButton(
                onPressed: () => viewModel.invokeMethod(),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    fixedSize: const Size.fromHeight(50)),
                child: const Text(
                  "SEND TO NATIVE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text(
              viewModel.state ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
