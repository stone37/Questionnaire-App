import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:questionnaire/data/api/remote_api.dart';
import 'package:questionnaire/data/models/request/question_request.dart';
import 'package:questionnaire/domain/entities/question.dart';
import 'package:questionnaire/domain/repository/quiz_repository.dart';

final quizRepositoryProvider =
    Provider<QuizRepository>((ref)=> QuizRepositoryImpl(ref.read(remoteApiProvider)));

class QuizRepositoryImpl extends QuizRepository {
  final RemoteApi _remoteApi;

  QuizRepositoryImpl(this._remoteApi); 

  @override
  Future<List<Question>> getQuestions({required int numQuestions, required int categoryId}) {
    return _remoteApi
        .getQuestions(QuestionRequest(type: 'multiple', amount: numQuestions, category: categoryId))
        .then((value) => value.map((e) => e.toEntity()).toList());
  }
}
