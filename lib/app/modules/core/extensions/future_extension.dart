import 'dart:async';

extension FutureExtension<T extends Object> on Future<T> {
  Future<T> resilience<TError extends Object>({
    int replayCount = 2,
    Duration delay = Duration.zero,
    FutureOr<void> Function(TError)? callback,
  }) async {
    int errorsCount = 0;
    T? response;
    do {
      try {
        response = await this;
      } on TError catch (error) {
        callback?.call(error);
        errorsCount++;
        await Future.delayed(delay);
      }
    } while (response == null && errorsCount < replayCount);
    return response!;
  }

  Future<T> resilienceWhen<TError extends Object>(
    FutureOr<bool> Function(TError) validation, {
    FutureOr<void> Function(TError)? callback,
    int replayCount = 2,
    Duration delay = Duration.zero,
  }) async {
    int errorsCount = 0;
    T? response;
    do {
      try {
        response = await this;
      } on TError catch (error) {
        if (!await validation.call(error)) rethrow;
        callback?.call(error);
        errorsCount++;
      }
    } while (response == null && errorsCount < replayCount);
    return response!;
  }
}
