import 'package:flutter/material.dart';
import 'package:sl/Subject_detail.dart';
// Import SubjectDetailPage

class SubjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        SubjectCard(subjectName: 'Chemistry'),
        SubjectCard(subjectName: 'Physics'),
        SubjectCard(subjectName: 'Biology'),
      ],
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String subjectName;

  const SubjectCard({required this.subjectName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: ListTile(
        title: Text(
          subjectName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        trailing: Icon(Icons.arrow_forward, color: Colors.teal),
        onTap: () {
          // Navigate to the Subject Detail Page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectDetailPage(subjectName: subjectName),
            ),
          );
        },
      ),
    );
  }
}
