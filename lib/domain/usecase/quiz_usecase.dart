import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:questionnaire/data/repository/quiz_repository_provider.dart';
import 'package:questionnaire/domain/entities/question.dart';
import 'package:questionnaire/domain/repository/quiz_repository.dart';

final quizUseCaseProvider =
    Provider<QuizUseCase>((ref) => QuizUseCase(ref.read(quizRepositoryProvider)));

class QuizUseCase {
  QuizUseCase(this._repository);

  final QuizRepository _repository;

  Future<List<Question>> getQuestions() {
    return _repository.getQuestions(numQuestions: 5, categoryId: Random().nextInt(24) + 9);
  }
}


