import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

export 'extensions/future_extension.dart';
export 'interfaces/failure.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => Dio(), export: true),
  ];
}
