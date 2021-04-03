import 'package:flutter/material.dart';
import 'package:flutter_upload_file_dio/progress.dart';
import 'package:provider/provider.dart';

class UploadWidget extends StatelessWidget {
  final String url = 'https://www.website.com/upload/';
  const UploadWidget();

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Consumer<UploadProgress>(
        builder: (context, status, _) {
          var progress = status.progress.toStringAsFixed(1);

          return ElevatedButton(
            child: Text('$progress %'),
            onPressed: () => status.start(url: url),
          );
        },
      ),
    );
  }
}
