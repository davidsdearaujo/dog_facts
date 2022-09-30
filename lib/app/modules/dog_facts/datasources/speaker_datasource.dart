import 'package:dio/dio.dart';
import 'package:dog_facts/app/modules/core/core_module.dart';
import 'package:dog_facts/app/modules/dog_facts/failures/speaker_failure.dart';
import 'package:html/dom.dart';

class SpeakerDatasource {
  final Dio _client;
  SpeakerDatasource(this._client);

  String? nonce;

  Future<String> getFileUrlFromText(String text) async {
    return _getFileUrlFromTextWithoutResilience(text).resilience<SpeakerFailure>(
      replayCount: 1,
      callback: (failure) async {
        if (failure.apiError == 'Invalid Nonce') nonce ??= await _getCurrentNonce();
      },
    );
  }

  Future<String> _getFileUrlFromTextWithoutResilience(String text) async {
    nonce ??= await _getCurrentNonce();
    final response = await _client.post(
      'https://www.readspeaker.com/',
      data: FormData.fromMap({
        'l': 'tts-software',
        'f': 'mp3',
        'v': 'US English - Paul (male)',
        't': text,
        '_wpnonce': nonce,
        'blDemoVerifyNonce': '0',
      }),
    );

    if (response.data['error'] != null) throw SpeakerFailure(apiError: response.data['error']);

    final fileUrl = response.data['links']['mp3'];
    return fileUrl;
  }

  Future<String?> _getCurrentNonce() async {
    //$('#_wpnonce')[0].value
    final response = await _client.get('https://www.readspeaker.com/');
    final document = Document.html(response.data);
    return document.getElementById('_wpnonce')?.attributes['value'];
  }
}
