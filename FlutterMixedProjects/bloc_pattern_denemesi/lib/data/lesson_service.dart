import 'package:bloc_pattern_denemesi/models/lesson.dart';

class LessonService {
  static List<Lesson> lessons = <Lesson>[];
  static LessonService _singleton = LessonService._internal();

  LessonService._internal();

  factory LessonService() {
    return _singleton;
  }

  static List<Lesson> getAll() {
    lessons.add(new Lesson(1, "Matematik", 4));
    lessons.add(new Lesson(2, "Türkçe", 3));
    lessons.add(new Lesson(3, "Iş Sağlığı", 2));
    lessons.add(new Lesson(4, "Tarih", 2));
    lessons.add(new Lesson(5, "Algoritma ve Programlama", 4));
    lessons.add(new Lesson(6, "Fizik", 4));
    return lessons;
  }
}
