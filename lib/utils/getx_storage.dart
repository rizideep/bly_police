import 'package:get_storage/get_storage.dart';

class GetStorageUtil {
  final box = GetStorage();

  void wrightBox(String key, dynamic value) {
    box.write(key, value);
  }

  dynamic read(
    String key,
  ) {
    return box.read(key);
  }

  void eraseAll() {
    box.erase();
  }
}
