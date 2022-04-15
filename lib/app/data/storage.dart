import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Storage extends GetxService {
  late GetStorage _data;

  void read(String key) async {
    await _data.read(key);
  }

  void write(String key, dynamic value) async {
    await _data.write(key, value);
  }
}
