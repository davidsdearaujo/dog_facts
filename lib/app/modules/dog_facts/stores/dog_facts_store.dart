import 'package:dog_facts/app/modules/core/core_module.dart';
import 'package:flutter_triple/flutter_triple.dart';

import '../datasources/dog_facts_datasource.dart';

class DogFactsStore extends StreamStore<Failure, DogFactsState> {
  final DogFactsDatasource _homeDatasource;
  DogFactsStore(this._homeDatasource) : super(DogFactsState.empty);

  Future<void> getFact() async {
    try {
      setLoading(true);
      final fact = await _homeDatasource.getDogFacts();
      update(state.copyWith(fact: fact));
    } on Failure catch (exception) {
      setError(exception);
    } finally {
      setLoading(false);
    }
  }
}

class DogFactsState {
  final String fact;

  const DogFactsState({required this.fact});
  static const DogFactsState empty = DogFactsState(fact: '');

  DogFactsState copyWith({
    String? fact,
  }) {
    return DogFactsState(
      fact: fact ?? this.fact,
    );
  }
}
