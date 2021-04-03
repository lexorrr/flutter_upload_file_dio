import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class UploadProgress with ChangeNotifier {
  var _progress = 0.0;
  double get progress => _progress;

  void start({
    required String url,
  }) async {

    final fileDir = await getTemporaryDirectory();
    final filePath = '${fileDir.path}/myfile.txt';

    final payload = FormData.fromMap({
      'nickname': 'Roberto',
      'file': await MultipartFile.fromFile(filePath)
    });

    await Dio().post<String>(url, data: payload,
      onSendProgress: (sent, total) {
        var pos = sent / total * 100;
        _updateProgress(pos);
      }
    );
  }

  void _resetProgress() {
    if (progress != 0) {
      _progress = 0;
      notifyListeners();
    }
  }

  void _updateProgress(double value) {
    _progress = value;
    notifyListeners();
  }
}