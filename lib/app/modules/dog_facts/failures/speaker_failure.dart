import 'package:dog_facts/app/modules/core/core_module.dart';

class SpeakerFailure extends Failure {
  final String? apiError;
  const SpeakerFailure({required this.apiError}) : super(code: 'speaker-failure', message: 'Não foi possível reproduzir o áudio.');
}
