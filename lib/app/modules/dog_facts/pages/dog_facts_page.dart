import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../controllers/dog_facts_controller.dart';
import '../shimmers/dog_fact_shimmer.dart';
import '../shimmers/refresh_button_shimmer.dart';
import '../stores/dog_facts_store.dart';

class DogFactsPage extends StatefulWidget {
  const DogFactsPage({Key? key}) : super(key: key);

  @override
  State<DogFactsPage> createState() => _DogFactsPageState();
}

class _DogFactsPageState extends State<DogFactsPage> {
  final DogFactsController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.initialize(context);
  }

  @override
  Widget build(BuildContext context) {
    return ScopedBuilder(
      store: controller.dogFactStore,
      onLoading: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Dog Facts')),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: kFloatingActionButtonMargin * 2),
            child: Row(
              children: const [
                RefreshButtonShimmer(),
                Spacer(),
                RefreshButtonShimmer(),
              ],
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(25),
            child: const DogFactShimmer(),
          ),
        );
      },
      onState: (context, DogFactsState state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Dog Facts')),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: kFloatingActionButtonMargin * 2),
                child: StreamBuilder(
                  stream: controller.audioPlayer.playerStateStream,
                  builder: (context, snapshot) {
                    if (controller.isPlayerLoading) return const RefreshButtonShimmer();
                    return ScopedBuilder(
                      store: controller.speakerStore,
                      onLoading: (context) => const RefreshButtonShimmer(),
                      onState: (context, state) {
                        return FloatingActionButton(
                          child: Icon(controller.playerIcon),
                          onPressed: controller.onPlayAudioTap,
                        );
                      },
                    );
                  },
                ),
              ),
              FloatingActionButton(
                child: const Icon(Icons.refresh),
                onPressed: controller.onRefreshButtonTap,
              ),
            ],
          ),
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(25),
            child: Text(
              controller.dogFactStore.state.fact,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
