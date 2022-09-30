import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:just_audio/just_audio.dart';

import '../stores/dog_facts_store.dart';
import '../stores/speaker_store.dart';

class DogFactsController implements Disposable {
  final DogFactsStore dogFactStore;
  final SpeakerStore speakerStore;
  final AudioPlayer audioPlayer;

  bool get isPlayerLoading => audioPlayer.playerState.processingState == ProcessingState.loading;
  IconData get playerIcon => audioPlayer.playing ? Icons.volume_off_rounded : Icons.volume_up_rounded;

  DogFactsController(this.dogFactStore, this.speakerStore, this.audioPlayer);

  final _disposers = <Disposer>[];

  void initialize(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dogFactStore.getFact();
    });
    listenErrors(context);
  }

  Future<void> onRefreshButtonTap() async {
    if (audioPlayer.playing) await audioPlayer.stop();
    await dogFactStore.getFact();
    await speakerStore.getFile(dogFactStore.state.fact);
    if (speakerStore.state.fileUrl != null) await audioPlayer.setUrl(speakerStore.state.fileUrl!);
  }

  Future<void> onPlayAudioTap() async {
    if (audioPlayer.playing) {
      await audioPlayer.stop();
      await audioPlayer.seek(Duration.zero);
    } else {
      // await audioPlayer.setUrl(speakerStore.state.fileUrl!);
      audioPlayer.play();
    }
  }

  void listenErrors(BuildContext context) {
    final dogDisposer = dogFactStore.observer(onError: ((error) {
      if (error.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message!)),
        );
      }
    }));
    _disposers.add(dogDisposer);

    final speakerDisposer = speakerStore.observer(onError: ((error) {
      if (error.message != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message!)),
        );
      }
    }));
    _disposers.add(speakerDisposer);
  }

  @override
  void dispose() {
    for (var disposer in _disposers) {
      disposer.call();
    }
  }
}
