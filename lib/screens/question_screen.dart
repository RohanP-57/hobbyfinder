import 'package:flutter/material.dart';
import '../services/hobby_service.dart';
import '../services/gemini_service.dart';
import 'result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final List<String> questions = [
    "1. What do you enjoy doing in your free time?",
    "2. Are you more of an indoor or outdoor person?",
    "3. Do you prefer solo activities or group activities?",
    "4. Are you looking to learn a new skill or just relax?",
    "5. How much time can you spend on a hobby weekly?",
  ];

  final List<TextEditingController> controllers = List.generate(
    5,
    (index) => TextEditingController(),
  );

  bool isLoading = false;

  final String apiKey = "AIzaSyCWjX3NqQ8Y9VII_dOYKUK7WxIzAmMsUA4";
  late GeminiService geminiService;

  @override
  void initState() {
    super.initState();
    geminiService = GeminiService(
      apiKey,
    );
  }

  Future<void> _generateHobbies() async {
    setState(() => isLoading = true);

    final answers = controllers.map((c) => c.text).join("\n");
    final matchedHobbies = await HobbyService.findHobbies(answers);
    final hobbySuggestions = await geminiService.generateHobbySuggestions(
      answers,
      matchedHobbies,
    );

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(hobbies: hobbySuggestions),
        ),
      );
    }

    setState(() => isLoading = false);
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Answer These Questions"),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: questions.length + 1,
              itemBuilder: (context, index) {
                if (index == questions.length) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: isLoading ? null : _generateHobbies,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                        child:
                            isLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : const Text("Get My Hobby"),
                      ),
                    ],
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      questions[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: controllers[index],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Your answer",
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
