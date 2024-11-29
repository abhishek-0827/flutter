import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sl/QuizPage.dart';
import 'login_page.dart';
import 'home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Science Lab App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(), // Initial page
      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name!); // Parse the route
        if (uri.pathSegments.first == 'quiz') {
          // Dynamic route for Quiz pages
          final subjectName = uri.pathSegments.last;
          return MaterialPageRoute(
            builder: (context) => QuizPage(subjectName: subjectName),
          );
        }

        // Handle undefined routes
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Page not found!'),
            ),
          ),
        );
      },
    );
  }
}
