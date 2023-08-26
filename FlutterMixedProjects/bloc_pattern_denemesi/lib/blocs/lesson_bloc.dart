import 'dart:async';

import 'package:bloc_pattern_denemesi/data/lesson_service.dart';
import 'package:bloc_pattern_denemesi/models/lesson.dart';

class LessonBloc {
  final lessonStreamController = StreamController.broadcast();

  Stream get getStream => lessonStreamController.stream;

  List<Lesson> getAll() {
    return LessonService.getAll();
  }
}

final lessonBloc = LessonBloc();
