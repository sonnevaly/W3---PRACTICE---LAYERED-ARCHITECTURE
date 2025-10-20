import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  test('My first test', () {
    Question q1 =
        Question(title: "4-2", choices: ["1", "2", "3"], goodChoice: "2");
    Question q2 =
        Question(title: "4+2", choices: ["1", "2", "3"], goodChoice: "6");

    Quiz quiz = Quiz(questions: [q1, q2]);

    // Answer are all good
    quiz.addAnswer(Answer(question: q1, answerChoice: "2"));
    quiz.addAnswer(Answer(question: q2, answerChoice: "6"));

    // Score is 100
    expect(quiz.getScoreInPercentage(), equals(100));
  });
}
