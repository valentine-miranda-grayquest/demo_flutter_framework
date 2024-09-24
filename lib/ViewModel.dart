import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class Viewmodel extends Cubit<String?> {
  // Viewmodel() : super(null);

  Viewmodel() : super(null) {
    handleMethodsHandler();
  }

  String? nativeData;

  late MethodChannel _methodChannel = MethodChannel("Demo Method Channel");

  void invokeMethod() {
    try {
      _methodChannel.invokeListMethod("send_data", nativeData);
    } on MissingPluginException catch (error) {
      print(error.toString());
    }
  }

  void handleMethodsHandler() {
    _methodChannel.setMethodCallHandler(methodHandler);
  }

  Future<dynamic> methodHandler(MethodCall methodCall) async {
    switch (methodCall.method) {
      case "receive_data":
        emit(methodCall.arguments as String);
        print("Received Data: ${state ?? "N/A"}");
    }
    return null;
  }
}
