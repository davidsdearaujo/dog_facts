import 'package:dog_facts/app/modules/core/core_module.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../datasources/speaker_datasource.dart';

class SpeakerStore extends StreamStore<Failure, SpeakerState> {
  final SpeakerDatasource _speakerDatasource;
  SpeakerStore(this._speakerDatasource) : super(SpeakerState.empty);

  Future<void> getFile(String text) async {
    try {
      setLoading(true);
      final fileUrl = await _speakerDatasource.getFileUrlFromText(text);
      update(state.copyWith(fileUrl: fileUrl));
    } on Failure catch (failure) {
      setError(failure);
    } finally {
      setLoading(false);
    }
  }
}

class SpeakerState {
  final String? fileUrl;

  const SpeakerState({
    required this.fileUrl,
  });
  static const SpeakerState empty = SpeakerState(fileUrl: null);

  SpeakerState copyWith({
    String? fileUrl,
  }) {
    return SpeakerState(
      fileUrl: fileUrl ?? this.fileUrl,
    );
  }
}
