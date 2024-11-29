import 'package:flutter/material.dart';
import 'package:sl/QuizPage.dart';

class SubjectDetailPage extends StatelessWidget {
  final String subjectName;

  const SubjectDetailPage({required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$subjectName Details'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              subjectName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to VR application
                Navigator.pushNamed(context, '/vr-$subjectName');
              },
              child: Text('Open VR'),
            ),
            SizedBox(height: 10),
           ElevatedButton(
  onPressed: () {
    Navigator.pushNamed(context, '/quiz-$subjectName');
  },
  child: Text('Start Quiz'),
),

          ],
        ),
      ),
    );
  }
}
