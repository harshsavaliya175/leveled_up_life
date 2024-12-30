import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class SharePlusUtil {
  Future<void> shareTextOrImage({
    required String shareText,
    required String shareImageUrl,
  }) async {
    EasyLoading.show();
    if (shareImageUrl.isNotEmpty) {
      Directory directory = await getTemporaryDirectory();
      String path = directory.path;
      File file = File('$path/${DateTime.now().millisecondsSinceEpoch}.jpg');
      http.Response response = await http.get(Uri.parse(shareImageUrl));
      file.writeAsBytesSync(response.bodyBytes);
      Share.shareXFiles(
        [
          XFile(file.path),
        ],
        text: shareText,
      );
    } else {
      Share.share(shareText);
    }
    EasyLoading.dismiss();
  }
}
