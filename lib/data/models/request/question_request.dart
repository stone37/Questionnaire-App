import 'package:equatable/equatable.dart';

class QuestionRequest extends Equatable {
  const QuestionRequest({required this.type, required this.amount, required this.category});

  final String type;
  final int amount;
  final int category;

  @override
  List<Object?> get props => [
    type,
    amount,
    category
  ];

  Map<String, dynamic> toMap() {
    final queryParameters = {
      'type': type,
      'amount': amount,
      'category': category,
    };
    return queryParameters;
  }
  
}
