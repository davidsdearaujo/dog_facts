import 'package:dog_facts/app/modules/dog_facts/dog_facts_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/core/core_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: DogFactsModule()),
      ];
}
