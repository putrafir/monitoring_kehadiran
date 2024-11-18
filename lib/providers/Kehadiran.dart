import 'package:flutter/material.dart';
import 'package:monitoring_kehadiran/models/Student.dart';

class KehadiranProviders with ChangeNotifier {
  final List<Student> _student = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
  ];

  List<Student> get students => _student;

  final List<Map<String, dynamic>> _historyKehadiran = [];

  List<Map<String, dynamic>> get historyKehadiran => _historyKehadiran;

  void toggleKehadiran(int index) {
    _student[index].isPresent = !_student[index].isPresent;
    notifyListeners();
  }

  void saveKehadiran() {
    final presentCount = _student.where((s) => s.isPresent).length;
    final absentCount = _student.length - presentCount;

    _historyKehadiran.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    for (var student in _student) {
      student.isPresent = false;
    }
    notifyListeners();
  }
}
