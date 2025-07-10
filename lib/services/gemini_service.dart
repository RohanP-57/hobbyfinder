// NEW FILE – replace the old one completely
import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiService {
  static const String baseUrl = 'http://10.0.2.2:3000'; // emulator host

  static Future<String> generateHobbySuggestions(
      String answers,
      List<String> matchedHobbies,
      ) async {
    final prompt = '''
User's Answers:
$answers

From the following hobbies: ${matchedHobbies.join(', ')}

Please format the response like this for each hobby:

Hobby: [Hobby Name]
Description: [Short description of the hobby]
Reason: [Why this hobby fits the user based on their answers]

Only include hobbies from the list and return 2 to 4 best matches.
''';

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/recommend'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'prompt': prompt}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final text = data['candidates']?[0]?['content']?['parts']?[0]?['text'];
        return (text != null && text.trim().isNotEmpty)
            ? text.trim()
            : 'No relevant hobbies found. Try adjusting your answers.';
      } else {
        return 'Proxy error (${response.statusCode}): ${response.body}';
      }
    } catch (e) {
      return 'Error: $e';
    }
  }
}
