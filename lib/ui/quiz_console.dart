import 'dart:io';
import '../domain/quiz.dart';

class QuizConsole {
  List<Question> questions;
  List<Player> players = [];

  QuizConsole({required this.questions});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');
    while (true) {
      stdout.write('Your Name: ');
      String? name = stdin.readLineSync();
      if (name == null || name.isEmpty) {
        print('--- Quiz Finished ---');
        break;
      }

      Player player = Player(name: name);
      Quiz quiz = Quiz(questions: questions);

      for (var question in quiz.questions) {
        print('Question: ${question.title} (${question.points} points)');
        print('Choices: ${question.choices}');

        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          quiz.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }

      int score = quiz.getScoreInPercentage();
      int points = quiz.getScoreInPoint();
      player.updateScore(points);

      //add player to list
      players.add(player);

      print('--- Quiz Finished ---');
      print('${player.name}, your score in percentage: $score%');
      print('${player.name}, your score in points: $points');

      //show player
      for (var p in players) {
        print('Player:${p.name}   Score:${p.scorePlayer}');
      }
      print('');
    }
  }
}
