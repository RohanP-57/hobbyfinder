import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String hobbies;

  const ResultScreen({super.key, required this.hobbies});

  List<Map<String, String>> parseHobbyDetails(String hobbyText) {
    final hobbySections = hobbyText.split('\n\n');
    List<Map<String, String>> results = [];

    for (final section in hobbySections) {
      final lines = section.trim().split('\n');
      if (lines.length >= 2) {
        final title = lines[0].replaceAll('**', '').trim();
        final description = lines.sublist(1).join('\n');
        results.add({'title': title, 'description': description});
      }
    }

    return results;
  }

  @override
  Widget build(BuildContext context) {
    final hobbyList = parseHobbyDetails(hobbies);
    final textTheme = Theme.of(context).textTheme;
    final cardColor = Theme.of(context).cardColor;

    return Scaffold(
      appBar: AppBar(title: const Text("Your Recommended Hobbies")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              "Based on your answers:",
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...hobbyList.map((hobby) {
              return ExpansionTile(
                title: Text(
                  hobby['title'] ?? 'Unknown Hobby',
                  style: textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      hobby['description'] ?? '',
                      style: textTheme.bodyMedium?.copyWith(fontSize: 15),
                    ),
                  )
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
