import 'package:flutter_modular/flutter_modular.dart';
import 'package:just_audio/just_audio.dart';

import 'controllers/dog_facts_controller.dart';
import 'datasources/dog_facts_datasource.dart';
import 'datasources/speaker_datasource.dart';
import 'pages/dog_facts_page.dart';
import 'stores/dog_facts_store.dart';
import 'stores/speaker_store.dart';

class DogFactsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AudioPlayer()),
    //Controllers
    Bind.lazySingleton((i) => DogFactsController(i(), i(), i())),
    //Datasources
    Bind.lazySingleton((i) => DogFactsDatasource(i())),
    Bind.lazySingleton((i) => SpeakerDatasource(i())),
    //Stores
    Bind.lazySingleton((i) => DogFactsStore(i())),
    Bind.lazySingleton((i) => SpeakerStore(i())),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const DogFactsPage())),
      ];
}
