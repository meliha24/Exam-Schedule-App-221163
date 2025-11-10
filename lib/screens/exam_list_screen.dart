import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_detail_screen.dart';

class ExamListScreen extends StatelessWidget {
  const ExamListScreen({super.key});

  List<Exam> getExams() {
    return [

      Exam(subjectName: 'Математика 1', dateTime: DateTime(2025, 9, 25, 9, 0), rooms: ['A1', 'A2'], isPassed: true),
      Exam(subjectName: 'Програмирање', dateTime: DateTime(2025, 10, 5, 10, 0), rooms: ['B1'], isPassed: true),
      Exam(subjectName: 'Алгоритми', dateTime: DateTime(2025, 10, 10, 12, 0), rooms: ['C1'], isPassed: true),
      Exam(subjectName: 'Компјутерски мрежи', dateTime: DateTime(2025, 10, 15, 9, 0), rooms: ['D2'], isPassed: true),
      Exam(subjectName: 'Бази на податоци', dateTime: DateTime(2025, 10, 20, 11, 0), rooms: ['Lab 1'], isPassed: true),
      Exam(subjectName: 'Оперативни системи', dateTime: DateTime(2025, 11, 15, 8, 30), rooms: ['A3']),
      Exam(subjectName: 'Веб технологии', dateTime: DateTime(2025, 11, 20, 10, 0), rooms: ['Lab 2']),
      Exam(subjectName: 'Вештачка интелигенција', dateTime: DateTime(2025, 11, 25, 9, 0), rooms: ['E1']),
      Exam(subjectName: 'Софтверско инженерство', dateTime: DateTime(2025, 12, 1, 11, 0), rooms: ['C2']),
      Exam(subjectName: 'Мобилни апликации', dateTime: DateTime(2025, 12, 5, 13, 0), rooms: ['F1']),
    ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    final exams = getExams();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Распоред за испити - 221163'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ExamDetailScreen(exam: exam),
              ),
            ),
            child: ExamCard(exam: exam),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.blue.shade50,
        padding: const EdgeInsets.all(12),
        child: Text(
          'Вкупно испити: ${exams.length}',
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

