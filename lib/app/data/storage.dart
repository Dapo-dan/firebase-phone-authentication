import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:live_easy_assignment/app/core/utils/keys.dart';

class Storage extends GetxService {
  late GetStorage _data;

  Future<Storage> init() async {
    _data = GetStorage();
    // Checks if data is already stored in the local storage
    await _data.writeIfNull(dataKey, []);
    return this;
  }

  T read<T>(String key) {
    return _data.read(key);
  }

  void write(String key, dynamic value) async {
    await _data.write(key, value);
  }
}
