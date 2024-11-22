import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// To save the file in the device
class FileStorage {
  static Future<String> getExternalDocumentPath() async {
    // To check whether permission is given for this app or not.
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // If not we will ask for permission first
      await Permission.storage.request();
    }
    Directory directory = Directory("");
    if (Platform.isAndroid) {
      // Redirects it to download folder in android
      directory = Directory("/storage/emulated/0/Download");
      if(!directory.existsSync()){
        directory = Directory("/storage/emulated/0/Documents");
      }
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    final exPath = directory.path;
    if (kDebugMode) {
      print("Saved Path: $exPath");
    }
    await Directory(exPath).create(recursive: true);
    return exPath;
  }

  static Future<String> get _localPath async {
    // final directory = await getApplicationDocumentsDirectory();
    // return directory.path;
    // To get the external path from device of download folder
    final String directory = await getExternalDocumentPath();
    return directory;
  }

  static Future<File> writeCounter(Uint8List data,String name) async {
    final path = await _localPath;
    // Create a file for the path of
    // device and file name with extension
    File file= File('$path/$name');
    if (kDebugMode) {
      print("Save file");
    }

    // Write the data in the file you have created
    // return file.writeAsString(bytes);
    // return file.writeAsBytes(bytes);
    final buffer = data.buffer;
    return file.writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
}