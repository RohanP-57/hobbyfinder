import 'package:flutter/services.dart' show rootBundle;

class HobbyService {
  static Future<List<Map<String, String>>> loadHobbyData() async {
    final data = await rootBundle.loadString('assets/dataset/hobbylist.csv');
    List<Map<String, String>> hobbyList = [];

    List<String> lines = data.split('\n');
    for (var line in lines.skip(1)) {
      List<String> parts = line.split(',');
      if (parts.length == 2) {
        hobbyList.add({'name': parts[0].trim(), 'type': parts[1].trim()});
      }
    }
    return hobbyList;
  }

  static Future<List<String>> findHobbies(String userPreference) async {
    List<Map<String, String>> hobbies = await loadHobbyData();

    return hobbies
        .where((hobby) => (hobby['type']?.toLowerCase() ?? "").contains(userPreference.toLowerCase()))
        .map((hobby) => hobby['name'] ?? "Unknown Hobby")
        .take(4)
        .toList();
  }
}