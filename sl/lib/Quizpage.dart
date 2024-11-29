import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final String subjectName;

  const QuizPage({required this.subjectName});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, Object>> questions = [
    {
      'question': 'What is the chemical symbol for water?',
      'options': ['H2O', 'O2', 'CO2', 'NaCl'],
      'answer': 'H2O',
    },
    {
      'question': 'What is the unit of force?',
      'options': ['Joule', 'Pascal', 'Newton', 'Watt'],
      'answer': 'Newton',
    },
    // Add more questions
  ];

  int currentQuestion = 0;
  int score = 0;

  void _submitAnswer(String selectedAnswer) {
    if (selectedAnswer == questions[currentQuestion]['answer']) {
      score++;
    }

    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      Navigator.pop(context, score);
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];
    final options = question['options'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - ${widget.subjectName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question['question'] as String,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ...options.map((option) {
              return ElevatedButton(
                onPressed: () => _submitAnswer(option),
                child: Text(option),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
